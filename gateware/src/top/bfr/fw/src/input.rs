//! The UI's input events: the encoder's turns, clicks and long presses.
//! (The jack touch pads are not used yet; a pad source would produce the
//! same events.)

use tiliqua_hal::encoder::Encoder;

/// Holding the encoder down this long, without turning, is a long press.
pub const HOLD_MS: u32 = 500;

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Event {
    /// Detents turned since the last poll (negative: anticlockwise).
    Turn(i32),
    Click,
    Hold,
}

#[derive(Default)]
pub struct Input {
    held_ms: u32,
    /// A long press fired: the release that ends it is not a click.
    hold_fired: bool,
    turned_while_held: bool,
}

impl Input {
    /// Poll once a control tick. `pressed` is the button's raw state.
    pub fn poll(&mut self, enc: &mut impl Encoder, pressed: bool, period_ms: u32,
                out: &mut heapless::Vec<Event, 4>) {
        enc.update();
        let ticks = enc.poke_ticks() as i32;
        if ticks != 0 {
            out.push(Event::Turn(ticks)).ok();
            if pressed {
                self.turned_while_held = true;
            }
        }
        if pressed {
            self.held_ms = self.held_ms.saturating_add(period_ms);
            if self.held_ms >= HOLD_MS && !self.hold_fired && !self.turned_while_held {
                self.hold_fired = true;
                out.push(Event::Hold).ok();
            }
        }
        if enc.poke_btn() {
            // released
            if !self.hold_fired {
                out.push(Event::Click).ok();
            }
            self.held_ms = 0;
            self.hold_fired = false;
            self.turned_while_held = false;
        } else if !pressed {
            self.held_ms = 0;
        }
    }
}

/// Faster turns move further: one step a detent, three a detent when several
/// detents arrive in one tick.
pub fn accelerate(ticks: i32) -> i32 {
    if ticks.abs() >= 2 { ticks * 3 } else { ticks }
}
