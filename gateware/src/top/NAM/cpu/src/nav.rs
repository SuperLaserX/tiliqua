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
    /// The amp: profile, input, output, Lite/Full, with the meters.
    Amp,
    /// Bass, middle, treble and the noise gate.
    Tone,
    /// The USB drive.
    Browser,
    /// Input and output, as waves and spectrum.
    Scope,
    /// Calibration, the engine's figures.
    System,
}

impl Page {
    pub const ALL: [Page; 5] = [Page::Amp, Page::Tone, Page::Browser, Page::Scope, Page::System];

    pub const fn name(self) -> &'static str {
        match self {
            Page::Amp => "AMP",
            Page::Tone => "TONE",
            Page::Browser => "PROFILES",
            Page::Scope => "SCOPE",
            Page::System => "SYSTEM",
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
        Nav { page: Page::Amp, picking: None }
    }
}

impl Nav {
    pub fn page(&self) -> Page {
        self.page
    }

    pub fn go(&mut self, page: Page) {
        self.page = page;
        self.picking = None;
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
        assert_eq!(nav.handle(Event::Hold), None);
        assert_eq!(nav.picking(), Some(Page::Amp));
        nav.handle(Event::Turn(2));
        assert_eq!(nav.picking(), Some(Page::Browser));
        nav.handle(Event::Click);
        assert_eq!(nav.page(), Page::Browser);
        assert_eq!(nav.picking(), None);
    }

    #[test]
    fn a_second_long_press_stays_put() {
        let mut nav = Nav::default();
        nav.handle(Event::Hold);
        nav.handle(Event::Turn(-1));
        assert_eq!(nav.picking(), Some(Page::System));
        nav.handle(Event::Hold);
        assert_eq!(nav.page(), Page::Amp);
    }
}
