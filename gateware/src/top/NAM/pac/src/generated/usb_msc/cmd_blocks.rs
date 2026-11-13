#[doc = "Register `cmd_blocks` reader"]
pub type R = crate::R<CMD_BLOCKS_SPEC>;
#[doc = "Register `cmd_blocks` writer"]
pub type W = crate::W<CMD_BLOCKS_SPEC>;
#[doc = "Field `blocks` reader - blocks field"]
pub type BLOCKS_R = crate::FieldReader;
#[doc = "Field `blocks` writer - blocks field"]
pub type BLOCKS_W<'a, REG> = crate::FieldWriter<'a, REG, 7>;
impl R {
    #[doc = "Bits 0:6 - blocks field"]
    #[inline(always)]
    pub fn blocks(&self) -> BLOCKS_R {
        BLOCKS_R::new(self.bits & 0x7f)
    }
}
impl W {
    #[doc = "Bits 0:6 - blocks field"]
    #[inline(always)]
    pub fn blocks(&mut self) -> BLOCKS_W<'_, CMD_BLOCKS_SPEC> {
        BLOCKS_W::new(self, 0)
    }
}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`cmd_blocks::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`cmd_blocks::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct CMD_BLOCKS_SPEC;
impl crate::RegisterSpec for CMD_BLOCKS_SPEC {
    type Ux = u8;
}
#[doc = "`read()` method returns [`cmd_blocks::R`](R) reader structure"]
impl crate::Readable for CMD_BLOCKS_SPEC {}
#[doc = "`write(|w| ..)` method takes [`cmd_blocks::W`](W) writer structure"]
impl crate::Writable for CMD_BLOCKS_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets cmd_blocks to value 0"]
impl crate::Resettable for CMD_BLOCKS_SPEC {}
