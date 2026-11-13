#[doc = "Register `base` reader"]
pub type R = crate::R<BASE_SPEC>;
#[doc = "Register `base` writer"]
pub type W = crate::W<BASE_SPEC>;
#[doc = "Field `base` writer - base field"]
pub type BASE_W<'a, REG> = crate::FieldWriter<'a, REG, 23, u32>;
impl W {
    #[doc = "Bits 0:22 - base field"]
    #[inline(always)]
    pub fn base(&mut self) -> BASE_W<'_, BASE_SPEC> {
        BASE_W::new(self, 0)
    }
}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`base::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`base::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct BASE_SPEC;
impl crate::RegisterSpec for BASE_SPEC {
    type Ux = u32;
}
#[doc = "`read()` method returns [`base::R`](R) reader structure"]
impl crate::Readable for BASE_SPEC {}
#[doc = "`write(|w| ..)` method takes [`base::W`](W) writer structure"]
impl crate::Writable for BASE_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets base to value 0"]
impl crate::Resettable for BASE_SPEC {}
