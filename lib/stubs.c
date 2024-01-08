#include <caml/mlvalues.h>
#include <caml/custom.h>
#include <caml/alloc.h>
#include <caml/fail.h>

CAMLprim value custom_identifier(value v) {
  if (Is_block(v) && Tag_val(v) == Custom_tag) {
    const char *identifier = Custom_ops_val(v)->identifier;
    return caml_copy_string(identifier);
  }
  else
    caml_invalid_argument("bad");
}
