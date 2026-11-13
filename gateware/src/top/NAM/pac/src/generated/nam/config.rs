#[doc = "Register `config` reader"]
pub type R = crate::R<CONFIG_SPEC>;
#[doc = "Register `config` writer"]
pub type W = crate::W<CONFIG_SPEC>;
#[doc = "Field `n_rings` writer - n_rings field"]
pub type N_RINGS_W<'a, REG> = crate::FieldWriter<'a, REG, 6>;
#[doc = "Field `n_segments` writer - n_segments field"]
pub type N_SEGMENTS_W<'a, REG> = crate::FieldWriter<'a, REG, 9, u16>;
#[doc = "Field `late_after` writer - late_after field"]
pub type LATE_AFTER_W<'a, REG> = crate::FieldWriter<'a, REG, 4>;
#[doc = "Field `wpf_log2` writer - wpf_log2 field"]
pub type WPF_LOG2_W<'a, REG> = crate::FieldWriter<'a, REG, 2>;
#[doc = "Field `burst_log2` writer - burst_log2 field"]
pub type BURST_LOG2_W<'a, REG> = crate::FieldWriter<'a, REG, 3>;
#[doc = "Field `ring_log2` writer - ring_log2 field"]
pub type RING_LOG2_W<'a, REG> = crate::FieldWriter<'a, REG, 5>;
impl W {
    #[doc = "Bits 0:5 - n_rings field"]
    #[inline(always)]
    pub fn n_rings(&mut self) -> N_RINGS_W<'_, CONFIG_SPEC> {
        N_RINGS_W::new(self, 0)
    }
    #[doc = "Bits 6:14 - n_segments field"]
    #[inline(always)]
    pub fn n_segments(&mut self) -> N_SEGMENTS_W<'_, CONFIG_SPEC> {
        N_SEGMENTS_W::new(self, 6)
    }
    #[doc = "Bits 15:18 - late_after field"]
    #[inline(always)]
    pub fn late_after(&mut self) -> LATE_AFTER_W<'_, CONFIG_SPEC> {
        LATE_AFTER_W::new(self, 15)
    }
    #[doc = "Bits 19:20 - wpf_log2 field"]
    #[inline(always)]
    pub fn wpf_log2(&mut self) -> WPF_LOG2_W<'_, CONFIG_SPEC> {
        WPF_LOG2_W::new(self, 19)
    }
    #[doc = "Bits 21:23 - burst_log2 field"]
    #[inline(always)]
    pub fn burst_log2(&mut self) -> BURST_LOG2_W<'_, CONFIG_SPEC> {
        BURST_LOG2_W::new(self, 21)
    }
    #[doc = "Bits 24:28 - ring_log2 field"]
    #[inline(always)]
    pub fn ring_log2(&mut self) -> RING_LOG2_W<'_, CONFIG_SPEC> {
        RING_LOG2_W::new(self, 24)
    }
}
#[doc = "A CSR register. Parameters ---------- fields : :class:`dict` or :class:`list` or :class:`Field` Collection of register fields. If ``None`` (default), a dict is populated from Python :term:`variable annotations <python:variable annotations>`. ``fields`` is used to create a :class:`FieldActionMap`, :class:`FieldActionArray`, or :class:`FieldAction`, depending on its type (dict, list, or Field). Interface attributes -------------------- element : :class:`Element` Interface between this register and a CSR bus primitive. Attributes ---------- field : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Collection of field instances. f : :class:`FieldActionMap` or :class:`FieldActionArray` or :class:`FieldAction` Shorthand for :attr:`Register.field`. Raises ------ :exc:`TypeError` If ``fields`` is neither ``None``, a :class:`dict`, a :class:`list`, or a :class:`Field`. :exc:`ValueError` If ``fields`` is not ``None`` and at least one variable annotation is a :class:`Field`. :exc:`ValueError` If ``element.access`` is not readable and at least one field is readable. :exc:`ValueError` If ``element.access`` is not writable and at least one field is writable.\n\nYou can [`read`](crate::Reg::read) this register and get [`config::R`](R). You can [`reset`](crate::Reg::reset), [`write`](crate::Reg::write), [`write_with_zero`](crate::Reg::write_with_zero) this register using [`config::W`](W). You can also [`modify`](crate::Reg::modify) this register. See [API](https://docs.rs/svd2rust/#read--modify--write-api)."]
pub struct CONFIG_SPEC;
impl crate::RegisterSpec for CONFIG_SPEC {
    type Ux = u32;
}
#[doc = "`read()` method returns [`config::R`](R) reader structure"]
impl crate::Readable for CONFIG_SPEC {}
#[doc = "`write(|w| ..)` method takes [`config::W`](W) writer structure"]
impl crate::Writable for CONFIG_SPEC {
    type Safety = crate::Unsafe;
}
#[doc = "`reset()` method sets config to value 0"]
impl crate::Resettable for CONFIG_SPEC {}
