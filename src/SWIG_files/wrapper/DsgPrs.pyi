from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *


class DsgPrs_ArrowSide(IntEnum):
    DsgPrs_AS_NONE: int = ...
    DsgPrs_AS_FIRSTAR: int = ...
    DsgPrs_AS_LASTAR: int = ...
    DsgPrs_AS_BOTHAR: int = ...
    DsgPrs_AS_FIRSTPT: int = ...
    DsgPrs_AS_LASTPT: int = ...
    DsgPrs_AS_BOTHPT: int = ...
    DsgPrs_AS_FIRSTAR_LASTPT: int = ...
    DsgPrs_AS_FIRSTPT_LASTAR: int = ...

DsgPrs_AS_NONE = DsgPrs_ArrowSide.DsgPrs_AS_NONE
DsgPrs_AS_FIRSTAR = DsgPrs_ArrowSide.DsgPrs_AS_FIRSTAR
DsgPrs_AS_LASTAR = DsgPrs_ArrowSide.DsgPrs_AS_LASTAR
DsgPrs_AS_BOTHAR = DsgPrs_ArrowSide.DsgPrs_AS_BOTHAR
DsgPrs_AS_FIRSTPT = DsgPrs_ArrowSide.DsgPrs_AS_FIRSTPT
DsgPrs_AS_LASTPT = DsgPrs_ArrowSide.DsgPrs_AS_LASTPT
DsgPrs_AS_BOTHPT = DsgPrs_ArrowSide.DsgPrs_AS_BOTHPT
DsgPrs_AS_FIRSTAR_LASTPT = DsgPrs_ArrowSide.DsgPrs_AS_FIRSTAR_LASTPT
DsgPrs_AS_FIRSTPT_LASTAR = DsgPrs_ArrowSide.DsgPrs_AS_FIRSTPT_LASTAR

#classnotwrapped
class DsgPrs: ...

#classnotwrapped
class DsgPrs_AnglePresentation: ...

#classnotwrapped
class DsgPrs_Chamf2dPresentation: ...

#classnotwrapped
class DsgPrs_ConcentricPresentation: ...

#classnotwrapped
class DsgPrs_DatumPrs: ...

#classnotwrapped
class DsgPrs_DiameterPresentation: ...

#classnotwrapped
class DsgPrs_EllipseRadiusPresentation: ...

#classnotwrapped
class DsgPrs_EqualDistancePresentation: ...

#classnotwrapped
class DsgPrs_EqualRadiusPresentation: ...

#classnotwrapped
class DsgPrs_FilletRadiusPresentation: ...

#classnotwrapped
class DsgPrs_FixPresentation: ...

#classnotwrapped
class DsgPrs_IdenticPresentation: ...

#classnotwrapped
class DsgPrs_LengthPresentation: ...

#classnotwrapped
class DsgPrs_MidPointPresentation: ...

#classnotwrapped
class DsgPrs_OffsetPresentation: ...

#classnotwrapped
class DsgPrs_ParalPresentation: ...

#classnotwrapped
class DsgPrs_PerpenPresentation: ...

#classnotwrapped
class DsgPrs_RadiusPresentation: ...

#classnotwrapped
class DsgPrs_ShadedPlanePresentation: ...

#classnotwrapped
class DsgPrs_ShapeDirPresentation: ...

#classnotwrapped
class DsgPrs_SymbPresentation: ...

#classnotwrapped
class DsgPrs_SymmetricPresentation: ...

#classnotwrapped
class DsgPrs_TangentPresentation: ...

#classnotwrapped
class DsgPrs_XYZAxisPresentation: ...

#classnotwrapped
class DsgPrs_XYZPlanePresentation: ...

# harray1 classes
# harray2 classes
# hsequence classes

