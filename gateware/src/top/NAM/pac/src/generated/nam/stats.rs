#[doc = "Register `stats` reader"]
pub type R = crate::R<STATS_SPEC>;
#[doc = "Register `stats` writer"]
pub type W = crate::W<STATS_SPEC>;
#[doc = "Field `clocks_max` reader - clocks_max field"]
pub type CLOCKS_MAX_R = crate::FieldReader<u16>;
#[doc = "Field `overruns` reader - overruns field"]
pub type OVERRUNS_R = crate::FieldReader;
#[doc = "Field `samples` reader - samples field"]
pub type SAMPLES_R = crate::FieldReader;
impl R {
    #[doc = "Bits 0:15 - clocks_max field"]
    #[inline(always)]
    pub fn clocks_max(&self) -> CLOCKS_MAX_R {
        CLOCKS_MAX_R::new((self.bits & 0xffff) as u16)
    }
    #[doc = "Bits 16:23 - overruns field"]
    #[inline(always)]
    pub fn overruns(&self) -> OVERRUNS_R {
        OVERRUNS_R::new(((self.bits >> 16) & 0xff) as u8)
    }
    #[doc = "Bits 24:31 - samples field"]
    #[inline(always)]
    pub fn samples(&self) -> SAMPLES_R {
        SAMPLES_R::new(((self.bits >> 24) & 0xff) as u8)
    }
}
impl W {}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`stats::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`stats::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct STATS_SPEC;
impl crate::RegisterSpec for STATS_SPEC {
    type Ux = u32;
}
#[doc = "`read()` method returns [`stats::R`](R) reader structure"]
impl crate::Readable for STATS_SPEC {}
#[doc = "`write(|w| ..)` method takes [`stats::W`](W) writer structure"]
impl crate::Writable for STATS_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets stats to value 0"]
impl crate::Resettable for STATS_SPEC {}
