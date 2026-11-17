#[doc = "Register `tone` reader"]
pub type R = crate::R<TONE_SPEC>;
#[doc = "Register `tone` writer"]
pub type W = crate::W<TONE_SPEC>;
#[doc = "Field `value` writer - value field"]
pub type VALUE_W<'a, REG> = crate::FieldWriter<'a, REG, 27, u32>;
#[doc = "Field `index` writer - index field"]
pub type INDEX_W<'a, REG> = crate::FieldWriter<'a, REG, 5>;
impl W {
    #[doc = "Bits 0:26 - value field"]
    #[inline(always)]
    pub fn value(&mut self) -> VALUE_W<'_, TONE_SPEC> {
        VALUE_W::new(self, 0)
    }
    #[doc = "Bits 27:31 - index field"]
    #[inline(always)]
    pub fn index(&mut self) -> INDEX_W<'_, TONE_SPEC> {
        INDEX_W::new(self, 27)
    }
}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`tone::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`tone::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct TONE_SPEC;
impl crate::RegisterSpec for TONE_SPEC {
    type Ux = u32;
}
#[doc = "`read()` method returns [`tone::R`](R) reader structure"]
impl crate::Readable for TONE_SPEC {}
#[doc = "`write(|w| ..)` method takes [`tone::W`](W) writer structure"]
impl crate::Writable for TONE_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets tone to value 0"]
impl crate::Resettable for TONE_SPEC {}
