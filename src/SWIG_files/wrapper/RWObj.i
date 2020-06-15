/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define RWOBJDOCSTRING
"RWObj module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwobj.html"
%enddef
%module (package="OCC.Core", docstring=RWOBJDOCSTRING) RWObj


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<RWObj_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<TopoDS_module.hxx>
#include<TCollection_module.hxx>
#include<Graphic3d_module.hxx>
#include<gp_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<TDocStd_module.hxx>
#include<Graphic3d_module.hxx>
#include<Geom_module.hxx>
#include<TShort_module.hxx>
#include<Aspect_module.hxx>
#include<Bnd_module.hxx>
#include<Quantity_module.hxx>
#include<Message_module.hxx>
#include<Media_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Message.i
%import Poly.i
%import TopoDS.i
%import TCollection.i
%import Graphic3d.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum RWObj_SubMeshReason {
	RWObj_SubMeshReason_NewObject = 0,
	RWObj_SubMeshReason_NewGroup = 1,
	RWObj_SubMeshReason_NewMaterial = 2,
	RWObj_SubMeshReason_NewSmoothGroup = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class RWObj_SubMeshReason(IntEnum):
	RWObj_SubMeshReason_NewObject = 0
	RWObj_SubMeshReason_NewGroup = 1
	RWObj_SubMeshReason_NewMaterial = 2
	RWObj_SubMeshReason_NewSmoothGroup = 3
RWObj_SubMeshReason_NewObject = RWObj_SubMeshReason.RWObj_SubMeshReason_NewObject
RWObj_SubMeshReason_NewGroup = RWObj_SubMeshReason.RWObj_SubMeshReason_NewGroup
RWObj_SubMeshReason_NewMaterial = RWObj_SubMeshReason.RWObj_SubMeshReason_NewMaterial
RWObj_SubMeshReason_NewSmoothGroup = RWObj_SubMeshReason.RWObj_SubMeshReason_NewSmoothGroup
};
/* end python proxy for enums */

/* handles */
%wrap_handle(RWObj_Reader)
%wrap_handle(RWObj_TriangulationReader)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************
* class RWObj *
**************/
%rename(rwobj) RWObj;
class RWObj {
	public:
		/****************** ReadFile ******************/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Read specified obj file and returns its content as triangulation. in case of error, returns null handle.

Parameters
----------
theFile: char *
aProgInd: Message_ProgressIndicator,optional
	default value is NULL

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const char * theFile, const opencascade::handle<Message_ProgressIndicator> & aProgInd = NULL);

};


%extend RWObj {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWObj_IShapeReceiver *
*****************************/
%nodefaultctor RWObj_IShapeReceiver;
class RWObj_IShapeReceiver {
	public:
		/****************** BindNamedShape ******************/
		%feature("compactdefaultargs") BindNamedShape;
		%feature("autodoc", "@param theshape shape to register @param thename shape name @param thematerial shape material @param theisrootshape indicates that this is a root object (free shape).

Parameters
----------
theShape: TopoDS_Shape
theName: TCollection_AsciiString
theMaterial: RWObj_Material *
theIsRootShape: bool

Returns
-------
None
") BindNamedShape;
		virtual void BindNamedShape(const TopoDS_Shape & theShape, const TCollection_AsciiString & theName, const RWObj_Material * theMaterial, const Standard_Boolean theIsRootShape);

};


%extend RWObj_IShapeReceiver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class RWObj_Material *
***********************/
class RWObj_Material {
	public:
		TCollection_AsciiString Name;
		TCollection_AsciiString DiffuseTexture;
		TCollection_AsciiString SpecularTexture;
		TCollection_AsciiString BumpTexture;
		Quantity_Color AmbientColor;
		Quantity_Color DiffuseColor;
		Quantity_Color SpecularColor;
		Standard_ShortReal Shininess;
		Standard_ShortReal Transparency;
		/****************** RWObj_Material ******************/
		%feature("compactdefaultargs") RWObj_Material;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWObj_Material;
		 RWObj_Material();

};


%extend RWObj_Material {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWObj_MtlReader *
************************/
class RWObj_MtlReader {
	public:
		/****************** RWObj_MtlReader ******************/
		%feature("compactdefaultargs") RWObj_MtlReader;
		%feature("autodoc", "Main constructor.

Parameters
----------
theMaterials: NCollection_DataMap<TCollection_AsciiString, RWObj_Material>

Returns
-------
None
") RWObj_MtlReader;
		 RWObj_MtlReader(NCollection_DataMap<TCollection_AsciiString, RWObj_Material> & theMaterials);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Read the file.

Parameters
----------
theFolder: TCollection_AsciiString
theFile: TCollection_AsciiString

Returns
-------
bool
") Read;
		bool Read(const TCollection_AsciiString & theFolder, const TCollection_AsciiString & theFile);

};


%extend RWObj_MtlReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class RWObj_Reader *
*********************/
%nodefaultctor RWObj_Reader;
class RWObj_Reader : public Standard_Transient {
	public:
		class ObjVec3iHasher {};
		class VectorOfVertices {};
		/****************** ExternalFiles ******************/
		%feature("compactdefaultargs") ExternalFiles;
		%feature("autodoc", "Return the list of external file references.

Returns
-------
NCollection_IndexedMap<TCollection_AsciiString>
") ExternalFiles;
		const NCollection_IndexedMap<TCollection_AsciiString> & ExternalFiles();

		/****************** FileComments ******************/
		%feature("compactdefaultargs") FileComments;
		%feature("autodoc", "Returns file comments (lines starting with # at the beginning of file).

Returns
-------
TCollection_AsciiString
") FileComments;
		const TCollection_AsciiString & FileComments();

		/****************** IsSinglePrecision ******************/
		%feature("compactdefaultargs") IsSinglePrecision;
		%feature("autodoc", "Return single precision flag for reading vertex data (coordinates); false by default.

Returns
-------
bool
") IsSinglePrecision;
		Standard_Boolean IsSinglePrecision();

		/****************** MemoryLimit ******************/
		%feature("compactdefaultargs") MemoryLimit;
		%feature("autodoc", "Returns memory limit in bytes; -1 (no limit) by default.

Returns
-------
Standard_Size
") MemoryLimit;
		Standard_Size MemoryLimit();

		/****************** NbProbeElems ******************/
		%feature("compactdefaultargs") NbProbeElems;
		%feature("autodoc", "//!< number of probed polygon elements (of unknown size).

Returns
-------
int
") NbProbeElems;
		Standard_Integer NbProbeElems();

		/****************** NbProbeNodes ******************/
		%feature("compactdefaultargs") NbProbeNodes;
		%feature("autodoc", "Number of probed nodes.

Returns
-------
int
") NbProbeNodes;
		Standard_Integer NbProbeNodes();

		/****************** Probe ******************/
		%feature("compactdefaultargs") Probe;
		%feature("autodoc", "Probe data from obj file (comments, external references) without actually reading mesh data. although mesh data will not be collected, the full file content will be parsed, due to obj format limitations. @param thefile path to the file @param theprogress progress indicator returns true if success, false on error or user break. @sa filecomments(), externalfiles(), nbprobenodes(), nbprobeelems().

Parameters
----------
theFile: TCollection_AsciiString
theProgress: Message_ProgressIndicator

Returns
-------
bool
") Probe;
		Standard_Boolean Probe(const TCollection_AsciiString & theFile, const opencascade::handle<Message_ProgressIndicator> & theProgress);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads data from obj file. unicode paths can be given in utf-8 encoding. returns true if success, false on error or user break.

Parameters
----------
theFile: TCollection_AsciiString
theProgress: Message_ProgressIndicator

Returns
-------
bool
") Read;
		Standard_Boolean Read(const TCollection_AsciiString & theFile, const opencascade::handle<Message_ProgressIndicator> & theProgress);

		/****************** SetMemoryLimit ******************/
		%feature("compactdefaultargs") SetMemoryLimit;
		%feature("autodoc", "Specify memory limit in bytes, so that import will be aborted by specified limit before memory allocation error occurs.

Parameters
----------
theMemLimit: Standard_Size

Returns
-------
None
") SetMemoryLimit;
		void SetMemoryLimit(Standard_Size theMemLimit);

		/****************** SetSinglePrecision ******************/
		%feature("compactdefaultargs") SetSinglePrecision;
		%feature("autodoc", "Setup single/double precision flag for reading vertex data (coordinates).

Parameters
----------
theIsSinglePrecision: bool

Returns
-------
None
") SetSinglePrecision;
		void SetSinglePrecision(Standard_Boolean theIsSinglePrecision);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Setup transformation from one coordinate system to another. obj file might be exported following various coordinate system conventions, so that it might be useful automatically transform data during file reading.

Parameters
----------
theCSConverter: RWMesh_CoordinateSystemConverter

Returns
-------
None
") SetTransformation;
		void SetTransformation(const RWMesh_CoordinateSystemConverter & theCSConverter);

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return transformation from one coordinate system to another; no transformation by default.

Returns
-------
RWMesh_CoordinateSystemConverter
") Transformation;
		const RWMesh_CoordinateSystemConverter & Transformation();

};


%make_alias(RWObj_Reader)

%extend RWObj_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class RWObj_SubMesh *
**********************/
class RWObj_SubMesh {
	public:
		TCollection_AsciiString Object;
		TCollection_AsciiString Group;
		TCollection_AsciiString SmoothGroup;
		TCollection_AsciiString Material;
};


%extend RWObj_SubMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWObj_CafReader *
************************/
class RWObj_CafReader : public RWMesh_CafReader, protected RWObj_IShapeReceiver {
	public:
		/****************** RWObj_CafReader ******************/
		%feature("compactdefaultargs") RWObj_CafReader;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWObj_CafReader;
		 RWObj_CafReader();

		/****************** IsSinglePrecision ******************/
		%feature("compactdefaultargs") IsSinglePrecision;
		%feature("autodoc", "Return single precision flag for reading vertex data (coordinates); false by default.

Returns
-------
bool
") IsSinglePrecision;
		Standard_Boolean IsSinglePrecision();

		/****************** SetSinglePrecision ******************/
		%feature("compactdefaultargs") SetSinglePrecision;
		%feature("autodoc", "Setup single/double precision flag for reading vertex data (coordinates).

Parameters
----------
theIsSinglePrecision: bool

Returns
-------
None
") SetSinglePrecision;
		void SetSinglePrecision(Standard_Boolean theIsSinglePrecision);

};


%extend RWObj_CafReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWObj_TriangulationReader *
**********************************/
class RWObj_TriangulationReader : public RWObj_Reader {
	public:
		/****************** RWObj_TriangulationReader ******************/
		%feature("compactdefaultargs") RWObj_TriangulationReader;
		%feature("autodoc", "Constructor.

Returns
-------
None
") RWObj_TriangulationReader;
		 RWObj_TriangulationReader();

		/****************** GetTriangulation ******************/
		%feature("compactdefaultargs") GetTriangulation;
		%feature("autodoc", "Create poly_triangulation from collected data.

Returns
-------
opencascade::handle<Poly_Triangulation>
") GetTriangulation;
		virtual opencascade::handle<Poly_Triangulation> GetTriangulation();

		/****************** ResultShape ******************/
		%feature("compactdefaultargs") ResultShape;
		%feature("autodoc", "Return result shape.

Returns
-------
TopoDS_Shape
") ResultShape;
		TopoDS_Shape ResultShape();

		/****************** SetCreateShapes ******************/
		%feature("compactdefaultargs") SetCreateShapes;
		%feature("autodoc", "Set flag to create shapes.

Parameters
----------
theToCreateShapes: bool

Returns
-------
None
") SetCreateShapes;
		void SetCreateShapes(Standard_Boolean theToCreateShapes);

		/****************** SetShapeReceiver ******************/
		%feature("compactdefaultargs") SetShapeReceiver;
		%feature("autodoc", "Set shape receiver callback.

Parameters
----------
theReceiver: RWObj_IShapeReceiver *

Returns
-------
None
") SetShapeReceiver;
		void SetShapeReceiver(RWObj_IShapeReceiver * theReceiver);

};


%make_alias(RWObj_TriangulationReader)

%extend RWObj_TriangulationReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
