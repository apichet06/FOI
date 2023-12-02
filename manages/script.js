$("#insert").submit(function (e) {
    e.preventDefault();
    var insert = "insert";
    $.ajax({
        type: "post",
        url: "./manages/manages.asp",
        data: $(this).serialize() + "&insert=" + insert,
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
            }
        },
    });
});

