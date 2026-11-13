#[doc = "Register `meters` reader"]
pub type R = crate::R<METERS_SPEC>;
#[doc = "Register `meters` writer"]
pub type W = crate::W<METERS_SPEC>;
#[doc = "Field `in_peak` reader - in_peak field"]
pub type IN_PEAK_R = crate::FieldReader<u16>;
#[doc = "Field `out_peak` reader - out_peak field"]
pub type OUT_PEAK_R = crate::FieldReader<u16>;
impl R {
    #[doc = "Bits 0:15 - in_peak field"]
    #[inline(always)]
    pub fn in_peak(&self) -> IN_PEAK_R {
        IN_PEAK_R::new((self.bits & 0xffff) as u16)
    }
    #[doc = "Bits 16:31 - out_peak field"]
    #[inline(always)]
    pub fn out_peak(&self) -> OUT_PEAK_R {
        OUT_PEAK_R::new(((self.bits >> 16) & 0xffff) as u16)
    }
}
impl W {}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`meters::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`meters::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct METERS_SPEC;
impl crate::RegisterSpec for METERS_SPEC {
    type Ux = u32;
}
#[doc = "`read()` method returns [`meters::R`](R) reader structure"]
impl crate::Readable for METERS_SPEC {}
#[doc = "`write(|w| ..)` method takes [`meters::W`](W) writer structure"]
impl crate::Writable for METERS_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets meters to value 0"]
impl crate::Resettable for METERS_SPEC {}
