#[doc = "Register `tswap` reader"]
pub type R = crate::R<TSWAP_SPEC>;
#[doc = "Register `tswap` writer"]
pub type W = crate::W<TSWAP_SPEC>;
#[doc = "Field `swap` writer - swap field"]
pub type SWAP_W<'a, REG> = crate::BitWriter<'a, REG>;
impl W {
    #[doc = "Bit 0 - swap field"]
    #[inline(always)]
    pub fn swap(&mut self) -> SWAP_W<'_, TSWAP_SPEC> {
        SWAP_W::new(self, 0)
    }
}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`tswap::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`tswap::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct TSWAP_SPEC;
impl crate::RegisterSpec for TSWAP_SPEC {
    type Ux = u8;
}
#[doc = "`read()` method returns [`tswap::R`](R) reader structure"]
impl crate::Readable for TSWAP_SPEC {}
#[doc = "`write(|w| ..)` method takes [`tswap::W`](W) writer structure"]
impl crate::Writable for TSWAP_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets tswap to value 0"]
impl crate::Resettable for TSWAP_SPEC {}
