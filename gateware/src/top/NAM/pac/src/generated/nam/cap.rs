#[doc = "Register `cap` reader"]
pub type R = crate::R<CAP_SPEC>;
#[doc = "Register `cap` writer"]
pub type W = crate::W<CAP_SPEC>;
#[doc = "Field `entry` reader - entry field"]
pub type ENTRY_R = crate::FieldReader<u32>;
#[doc = "Field `entry` writer - entry field"]
pub type ENTRY_W<'a, REG> = crate::FieldWriter<'a, REG, 32, u32>;
impl R {
    #[doc = "Bits 0:31 - entry field"]
    #[inline(always)]
    pub fn entry(&self) -> ENTRY_R {
        ENTRY_R::new(self.bits)
    }
}
impl W {
    #[doc = "Bits 0:31 - entry field"]
    #[inline(always)]
    pub fn entry(&mut self) -> ENTRY_W<'_, CAP_SPEC> {
        ENTRY_W::new(self, 0)
    }
}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`cap::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`cap::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct CAP_SPEC;
impl crate::RegisterSpec for CAP_SPEC {
    type Ux = u32;
}
#[doc = "`read()` method returns [`cap::R`](R) reader structure"]
impl crate::Readable for CAP_SPEC {}
#[doc = "`write(|w| ..)` method takes [`cap::W`](W) writer structure"]
impl crate::Writable for CAP_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets cap to value 0"]
impl crate::Resettable for CAP_SPEC {}
