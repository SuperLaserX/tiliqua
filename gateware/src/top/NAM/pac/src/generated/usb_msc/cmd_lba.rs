#[doc = "Register `cmd_lba` reader"]
pub type R = crate::R<CMD_LBA_SPEC>;
#[doc = "Register `cmd_lba` writer"]
pub type W = crate::W<CMD_LBA_SPEC>;
#[doc = "Field `lba` reader - lba field"]
pub type LBA_R = crate::FieldReader<u32>;
#[doc = "Field `lba` writer - lba field"]
pub type LBA_W<'a, REG> = crate::FieldWriter<'a, REG, 32, u32>;
impl R {
    #[doc = "Bits 0:31 - lba field"]
    #[inline(always)]
    pub fn lba(&self) -> LBA_R {
        LBA_R::new(self.bits)
    }
}
impl W {
    #[doc = "Bits 0:31 - lba field"]
    #[inline(always)]
    pub fn lba(&mut self) -> LBA_W<'_, CMD_LBA_SPEC> {
        LBA_W::new(self, 0)
    }
}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`cmd_lba::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`cmd_lba::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct CMD_LBA_SPEC;
impl crate::RegisterSpec for CMD_LBA_SPEC {
    type Ux = u32;
}
#[doc = "`read()` method returns [`cmd_lba::R`](R) reader structure"]
impl crate::Readable for CMD_LBA_SPEC {}
#[doc = "`write(|w| ..)` method takes [`cmd_lba::W`](W) writer structure"]
impl crate::Writable for CMD_LBA_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets cmd_lba to value 0"]
impl crate::Resettable for CMD_LBA_SPEC {}
