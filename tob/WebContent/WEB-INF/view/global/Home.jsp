<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src= "${context}/js/global.js"></script>
<script type="text/javascript">
	$(function() {
		Global.init();
		$('#box').load('${context}/main/header.do');
		$('#footer').load('${context}/main/footer.do');
	});
	
</script>