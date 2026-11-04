//! Which screen is showing, and the screen switcher.
//!
//! A long press opens the switcher from anywhere: turn to pick a screen, click
//! to go to it, long press again to stay where you were. Everything else
//! belongs to the screen showing.

/// What the encoder did. Turns are in detents; negative is anticlockwise.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Event {
    Turn(i32),
    Click,
    Hold,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Page {
    Oscillators,
    Wave,
    Cross,
    Envelopes,
    Routing,
    Mixer,
    Browser,
    Patches,
}

impl Page {
    pub const ALL: [Page; 8] = [
        Page::Oscillators,
        Page::Wave,
        Page::Cross,
        Page::Envelopes,
        Page::Routing,
        Page::Mixer,
        Page::Browser,
        Page::Patches,
    ];

    pub const fn name(self) -> &'static str {
        match self {
            Page::Oscillators => "OSCILLATORS",
            Page::Wave => "WAVE VIEW",
            Page::Cross => "CROSS MOD",
            Page::Envelopes => "ENVELOPES",
            Page::Routing => "ROUTING",
            Page::Mixer => "MIXER",
            Page::Browser => "BROWSER",
            Page::Patches => "PATCHES",
        }
    }

    pub fn index(self) -> usize {
        Page::ALL.iter().position(|p| *p == self).unwrap_or(0)
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Nav {
    page: Page,
    /// The screen highlighted in the switcher, while it is open.
    picking: Option<usize>,
}

impl Default for Nav {
    fn default() -> Self {
        Nav { page: Page::Oscillators, picking: None }
    }
}

impl Nav {
    pub fn page(&self) -> Page {
        self.page
    }

    pub fn picking(&self) -> Option<Page> {
        self.picking.map(|i| Page::ALL[i])
    }

    /// Takes the switcher's events; returns the ones for the screen showing.
    pub fn handle(&mut self, event: Event) -> Option<Event> {
        match (self.picking, event) {
            (None, Event::Hold) => {
                self.picking = Some(self.page.index());
                None
            }
            (None, e) => Some(e),
            (Some(_), Event::Hold) => {
                self.picking = None;
                None
            }
            (Some(i), Event::Turn(n)) => {
                let len = Page::ALL.len() as i32;
                self.picking = Some((i as i32 + n).rem_euclid(len) as usize);
                None
            }
            (Some(i), Event::Click) => {
                self.page = Page::ALL[i];
                self.picking = None;
                None
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn events_go_to_the_screen_until_the_switcher_opens() {
        let mut nav = Nav::default();
        assert_eq!(nav.handle(Event::Turn(2)), Some(Event::Turn(2)));
        assert_eq!(nav.handle(Event::Click), Some(Event::Click));
        assert_eq!(nav.handle(Event::Hold), None);
        assert_eq!(nav.picking(), Some(Page::Oscillators));
        assert_eq!(nav.handle(Event::Turn(1)), None);
    }

    #[test]
    fn a_click_goes_to_the_highlighted_screen() {
        let mut nav = Nav::default();
        nav.handle(Event::Hold);
        nav.handle(Event::Turn(3));
        assert_eq!(nav.picking(), Some(Page::Envelopes));
        assert_eq!(nav.page(), Page::Oscillators, "not until the click");
        nav.handle(Event::Click);
        assert_eq!(nav.page(), Page::Envelopes);
        assert_eq!(nav.picking(), None);
    }

    #[test]
    fn a_second_long_press_stays_put() {
        let mut nav = Nav::default();
        nav.handle(Event::Hold);
        nav.handle(Event::Turn(3));
        nav.handle(Event::Hold);
        assert_eq!(nav.page(), Page::Oscillators);
        assert_eq!(nav.picking(), None);
    }

    #[test]
    fn the_switcher_wraps_both_ways_and_opens_on_the_current_screen() {
        let mut nav = Nav::default();
        nav.handle(Event::Hold);
        nav.handle(Event::Turn(-1));
        assert_eq!(nav.picking(), Some(Page::Patches));
        nav.handle(Event::Turn(1));
        assert_eq!(nav.picking(), Some(Page::Oscillators));
        nav.handle(Event::Turn(-17));
        assert_eq!(nav.picking(), Some(Page::Patches));
        nav.handle(Event::Click);
        nav.handle(Event::Hold);
        assert_eq!(nav.picking(), Some(Page::Patches));
    }
}
