// Autogenerated by Thrift Compiler (facebook)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
// @generated

package matching_names

import (
	"bytes"
	"context"
	"sync"
	"fmt"
	thrift "github.com/facebook/fbthrift/thrift/lib/go/thrift"
	IncludesAlso0 "IncludesAlso"

)

// (needed to ensure safety because of naive import list construction.)
var _ = thrift.ZERO
var _ = fmt.Printf
var _ = sync.Mutex{}
var _ = bytes.Equal
var _ = context.Background

var _ = IncludesAlso0.GoUnusedProtection__
var GoUnusedProtection__ int;

// Attributes:
//  - Also
type IncludesAlso struct {
  Also *IncludesAlso0.Also `thrift:"also,1" db:"also" json:"also"`
}

func NewIncludesAlso() *IncludesAlso {
  return &IncludesAlso{
Also: IncludesAlso0.NewAlso(),
}
}

var IncludesAlso_Also_DEFAULT *IncludesAlso0.Also
func (p *IncludesAlso) GetAlso() *IncludesAlso0.Also {
  if !p.IsSetAlso() {
    return IncludesAlso_Also_DEFAULT
  }
return p.Also
}
func (p *IncludesAlso) IsSetAlso() bool {
  return p != nil && p.Also != nil
}

func (p *IncludesAlso) Read(iprot thrift.Protocol) error {
  if _, err := iprot.ReadStructBegin(); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T read error: ", p), err)
  }


  for {
    _, fieldTypeId, fieldId, err := iprot.ReadFieldBegin()
    if err != nil {
      return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", p, fieldId), err)
    }
    if fieldTypeId == thrift.STOP { break; }
    switch fieldId {
    case 1:
      if err := p.ReadField1(iprot); err != nil {
        return err
      }
    default:
      if err := iprot.Skip(fieldTypeId); err != nil {
        return err
      }
    }
    if err := iprot.ReadFieldEnd(); err != nil {
      return err
    }
  }
  if err := iprot.ReadStructEnd(); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", p), err)
  }
  return nil
}

func (p *IncludesAlso)  ReadField1(iprot thrift.Protocol) error {
  p.Also = IncludesAlso0.NewAlso()
  if err := p.Also.Read(iprot); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T error reading struct: ", p.Also), err)
  }
  return nil
}

func (p *IncludesAlso) Write(oprot thrift.Protocol) error {
  if err := oprot.WriteStructBegin("IncludesAlso"); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", p), err) }
  if err := p.writeField1(oprot); err != nil { return err }
  if err := oprot.WriteFieldStop(); err != nil {
    return thrift.PrependError("write field stop error: ", err) }
  if err := oprot.WriteStructEnd(); err != nil {
    return thrift.PrependError("write struct stop error: ", err) }
  return nil
}

func (p *IncludesAlso) writeField1(oprot thrift.Protocol) (err error) {
  if err := oprot.WriteFieldBegin("also", thrift.STRUCT, 1); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T write field begin error 1:also: ", p), err) }
  if err := p.Also.Write(oprot); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T error writing struct: ", p.Also), err)
  }
  if err := oprot.WriteFieldEnd(); err != nil {
    return thrift.PrependError(fmt.Sprintf("%T write field end error 1:also: ", p), err) }
  return err
}

func (p *IncludesAlso) String() string {
  if p == nil {
    return "<nil>"
  }

  var alsoVal string
  if p.Also == nil {
    alsoVal = "<nil>"
  } else {
    alsoVal = fmt.Sprintf("%v", p.Also)
  }
  return fmt.Sprintf("IncludesAlso({Also:%s})", alsoVal)
}

