#[doc = "Register `plug_events` reader"]
pub type R = crate::R<PLUG_EVENTS_SPEC>;
#[doc = "Register `plug_events` writer"]
pub type W = crate::W<PLUG_EVENTS_SPEC>;
#[doc = "Field `count` reader - count field"]
pub type COUNT_R = crate::FieldReader<u32>;
impl R {
    #[doc = "Bits 0:31 - count field"]
    #[inline(always)]
    pub fn count(&self) -> COUNT_R {
        COUNT_R::new(self.bits)
    }
}
impl W {}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`plug_events::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`plug_events::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct PLUG_EVENTS_SPEC;
impl crate::RegisterSpec for PLUG_EVENTS_SPEC {
    type Ux = u32;
}
#[doc = "`read()` method returns [`plug_events::R`](R) reader structure"]
impl crate::Readable for PLUG_EVENTS_SPEC {}
#[doc = "`write(|w| ..)` method takes [`plug_events::W`](W) writer structure"]
impl crate::Writable for PLUG_EVENTS_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets plug_events to value 0"]
impl crate::Resettable for PLUG_EVENTS_SPEC {}
