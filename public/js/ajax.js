$(document).ready(function (e) {
    const ajaxFunc = (...params) => {
        $.ajax({
            url: `${params[0]}`,
            dataType: "json",
            success: function (data) {
                if (params.length > 1) {
                    console.log("test");
                    params[1](data);
                }
            },
        });
    };

    // Kebutuhan Modal Box Bukti Pembayaran
    const modalBox = (data) => {
        console.log(data);
        // $("#bukti-bayar").attr("src", `/storage/${data.bukti_bayar}`);
        let ext = data.file.split(".").pop().toLowerCase();
        // console.log(ext);
        if (ext != "pdf") {
            $(".modal-dialog").removeClass("modal-lg");
            $(".modal-body").html(
                `<img src="/storage/${data.file}" alt="" class="w-100">`
            );
        } else {
            $(".modal-dialog").addClass("modal-lg");
            $(".modal-body").html(
                `<embed class="pdfobject" type="application/pdf" title="Embedded PDF" src="/storage/${data.file}" style="overflow: auto; width: 100%; height: 80vh;">`
            );
            // PDFObject.embed(`/storage/${data.file}`, "#example1");
        }
        $(".modal-title").html(`Tim ${data.nama_tim}`);
        $(".modal-footer").html(modalFooter(data));
    };

    const modalFooter = (data) => {
        let ext = data.file.split(".").pop().toLowerCase();
        let str =
            '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
        if (ext != "pdf") {
            str += `<a href="/storage/${data.file}" class="btn btn-primary" download="bukti_bayar_tim_${data.nama_tim}"><i class="bi bi-cloud-download"></i> Bukti</a>`;
        } else {
            str += `<a href="/storage/${data.file}" class="btn btn-primary" download="data_tim_${data.nama_tim}"><i class="bi bi-cloud-download"></i> Identitas Tim</a>`;
        }
        return str;
    };

    // $(".btn-modal").on("click", function (e) {
    //     let id = $(this).data("team-id");
    //     let url = `/dashboard/files/${id}`;
    //     ajaxFunc(url, modalBox);
    // });

    // $(e.target).

    // Akhir Kebutuhan Modal Box Bukti Pembayaran

    // Kebutuhan Send Email

    // $("#select-all").on("change", function () {
    //     if ($("#select-all").prop("checked")) {
    //         $(".chk-participant").prop("checked", true);
    //     } else {
    //         $(".chk-participant").prop("checked", false);
    //     }
    // });

    // $("#send-email").on("click", function () {
    //     $("#checkParticipant").submit();
    // });

    // Akhir Kebutuhan Send Email

    // Kebutuhan Filtering
    const ajaxParticipants = (row) => {
        $("#container").html(row);
    };

    $("body").on("click", function (e) {
        if ($(e.target).hasClass("dropdown-item")) {
            let filter = $(e.target).text().toLowerCase();
            let id_lomba = $(e.target).data("competition");
            let slug = $(e.target).data("abbreviation");
            console.log(slug);
            let url = `/dashboard/participants-${slug}`;
            if (filter != "all") {
                $(".pagination").addClass("d-none");
                url = `/dashboard/teams-ajax?status=${filter}&id_lomba=${id_lomba}&slug=${slug}`;
            } else {
                $(".pagination").removeClass("d-none");
            }
            $.get(url, {}, ajaxParticipants);
        } else if ($(e.target).attr("id") == "select-all") {
            let storeTeam = [];
            // console.log("test");
            if ($(e.target).attr("id", "select-all").prop("checked")) {
                $(".chk-participant").prop("checked", true);
            } else {
                $(".chk-participant").prop("checked", false);
            }
        } else if ($(e.target).attr("id") == "send-email") {
            $("#checkParticipant").submit();
        } else if ($(e.target).hasClass("btn-bukti-bayar")) {
            // console.log($(e.target).hasClass("btn-modal"));
            let nama = $(e.target).data("team-name");
            console.log(nama);
            let url = `/dashboard/files/${nama}?type=jpg`;
            ajaxFunc(url, modalBox);
            // $("#exampleModal").modal("show");
        } else if ($(e.target).hasClass("btn-identitas-tim")) {
            let nama = $(e.target).data("team-name");
            console.log(nama);
            let url = `/dashboard/files/${nama}?type=pdf`;
            ajaxFunc(url, modalBox);
        } else if ($(e.target).hasClass("btn-hapus")) {
            var form = $("#showDelete");
            // $(".space").html("");
            e.preventDefault();
            swal({
                title: `Are you sure you want to delete this record?`,
                text: "If you delete this, it will be gone forever.",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            }).then((willDelete) => {
                if (willDelete) {
                    form.submit();
                }
            });
        }
    });
    // Akhir Kebutuhan Filtering

    // Awal payment
    // Akhir Payment
});

$(".pay-button").on("click", function () {
    // Trigger snap popup. @TODO: Replace TRANSACTION_TOKEN_HERE with your transaction token
    console.log("test");
    console.log($(this).data("token"));
    window.snap.pay($(this).data("token"), {
        onSuccess: function (result) {
            /* You may add your own implementation here */
            alert("payment success!");
            console.log(result);
        },
        onPending: function (result) {
            /* You may add your own implementation here */
            alert("wating your payment!");
            console.log(result);
        },
        onError: function (result) {
            /* You may add your own implementation here */
            alert("payment failed!");
            console.log(result);
        },
        onClose: function () {
            /* You may add your own implementation here */
            alert("you closed the popup without finishing the payment");
        },
    });
});
