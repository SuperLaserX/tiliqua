#[doc = "Register `cmd_dir` reader"]
pub type R = crate::R<CMD_DIR_SPEC>;
#[doc = "Register `cmd_dir` writer"]
pub type W = crate::W<CMD_DIR_SPEC>;
#[doc = "Field `write` reader - write field"]
pub type WRITE_R = crate::BitReader;
#[doc = "Field `write` writer - write field"]
pub type WRITE_W<'a, REG> = crate::BitWriter<'a, REG>;
impl R {
    #[doc = "Bit 0 - write field"]
    #[inline(always)]
    pub fn write(&self) -> WRITE_R {
        WRITE_R::new((self.bits & 1) != 0)
    }
}
impl W {
    #[doc = "Bit 0 - write field"]
    #[inline(always)]
    pub fn write(&mut self) -> WRITE_W<'_, CMD_DIR_SPEC> {
        WRITE_W::new(self, 0)
    }
}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`cmd_dir::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`cmd_dir::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct CMD_DIR_SPEC;
impl crate::RegisterSpec for CMD_DIR_SPEC {
    type Ux = u8;
}
#[doc = "`read()` method returns [`cmd_dir::R`](R) reader structure"]
impl crate::Readable for CMD_DIR_SPEC {}
#[doc = "`write(|w| ..)` method takes [`cmd_dir::W`](W) writer structure"]
impl crate::Writable for CMD_DIR_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets cmd_dir to value 0"]
impl crate::Resettable for CMD_DIR_SPEC {}
