#[doc = "Register `tcommit` reader"]
pub type R = crate::R<TCOMMIT_SPEC>;
#[doc = "Register `tcommit` writer"]
pub type W = crate::W<TCOMMIT_SPEC>;
#[doc = "Field `table` writer - table field"]
pub type TABLE_W<'a, REG> = crate::FieldWriter<'a, REG, 3>;
#[doc = "Field `index` writer - index field"]
pub type INDEX_W<'a, REG> = crate::FieldWriter<'a, REG, 11, u16>;
impl W {
    #[doc = "Bits 0:2 - table field"]
    #[inline(always)]
    pub fn table(&mut self) -> TABLE_W<'_, TCOMMIT_SPEC> {
        TABLE_W::new(self, 0)
    }
    #[doc = "Bits 3:13 - index field"]
    #[inline(always)]
    pub fn index(&mut self) -> INDEX_W<'_, TCOMMIT_SPEC> {
        INDEX_W::new(self, 3)
    }
}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`tcommit::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`tcommit::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct TCOMMIT_SPEC;
impl crate::RegisterSpec for TCOMMIT_SPEC {
    type Ux = u16;
}
#[doc = "`read()` method returns [`tcommit::R`](R) reader structure"]
impl crate::Readable for TCOMMIT_SPEC {}
#[doc = "`write(|w| ..)` method takes [`tcommit::W`](W) writer structure"]
impl crate::Writable for TCOMMIT_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets tcommit to value 0"]
impl crate::Resettable for TCOMMIT_SPEC {}
