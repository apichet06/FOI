$("#kcepart").change(function (e) {
  e.preventDefault();
  var id = $("#kcepart").val();
  $.ajax({
    type: "post",
    url: "select_data.asp",
    data: { id: id },
    success: function (response) {
      console.log(response);
      $("#show_select_data").html(response);
    }
  });
});



$("#insert").submit(function (e) {
  e.preventDefault();
  var insert_update = "insert_update";
  $.ajax({
    type: "post",
    url: "manages.asp",
    data: $(this).serialize() + "&insert_update=" + insert_update,
    beforeSend: function () {
      $("#smt_loading").html("Loading...");
    },
    success: function (response) {
      if (response == "3") {
        Swal.fire({
          title: "INSERT",
          text: "บันทีกข้อมูลเรียบร้อย!",
          icon: "success",
          showCancelButton: false,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "OK",
        }).then((result) => {
          if (result.isConfirmed) {
            location.reload();
          }
        });
      } else if (response == "2") {
        Swal.fire({
          title: "UPDATE",
          text: "แก้ไขข้อมูลเรียบร้อย!",
          icon: "success",
          showCancelButton: false,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "OK",
        }).then((result) => {
          if (result.isConfirmed) {
            location.reload();
          }
        });
      } else if (response == "0") {
        Swal.fire({
          icon: "error",
          title: "Oops...",
          text: "มีบางอย่างผิดพลาด!",
        });
      } else if (response == "4") {
        Swal.fire({
          icon: "error",
          title: "Oops...",
          text: "KCEPART & CUSTOMER CODE มีอยู่แล้ว!",
        });
      }
    },
  });
});

$("#delete").click(function (e) {
  e.preventDefault();
  var id = document.getElementById("ID").value;
  var del = "delete";
  Swal.fire({
    title: "ต้องการลบ?",
    icon: "warning",
    showCancelButton: true,
    confirmButtonText: "ใช่",
    cancelButtonText: "ไม่",
    reverseButtons: true,
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        type: "post",
        url: "manages.asp",
        data: { id: id, del: del },
        success: function (response) {
          if (response == "1") {
            Swal.fire({
              icon: "success",
              title: "ลบข้อมูลเรียบร้อย",
              showConfirmButton: false,
            });
            setTimeout(() => {
              location.href = "default.asp";
            }, 1000);
          } else {
            Swal.fire({
              icon: "error",
              title: "Oops...",
              text: "มีบางอย่างผิดพลาด!",
            });
          }
        },
      });
    }
  });
});
