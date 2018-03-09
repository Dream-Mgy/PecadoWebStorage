function search() {
    if ($("#inputBox").val()) {
        window.location.href="http://localhost:8080/pecado/index.do?searchKey=" + $("#inputBox").val();
    }
}

$("#submitButton").bind('click', function() {
    if (!$("#file").val()) {
        alert("请选择上传文件");
        return;
    }
    $("#fileForm").submit();
})