<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid footer py-5" >
            <div class="container py-5" >
                <div class="row g-5" align="center">
                
                    <div class="col">
                        <div class="footer-item d-flex flex-column">
                            <h4 class="mb-3 text-white">오늘의 캠핑장</h4>
                            <a href=""><i class="fas fa-angle-right me-2"></i>${footAList }</a>
                        </div>
                    </div>
                    
                    <div class="col">
                        <div class="footer-item d-flex flex-column">
                            <h4 class="mb-3 text-white">오늘의 맛집</h4>
                            <a href=""><i class="fas fa-angle-right me-2"></i>${footBList }</a>
                        </div>
                    </div>
                    
                    <div class="col">
                        <div class="footer-item d-flex flex-column">
                            <h4 class="mb-3 text-white">오늘의 레시피</h4>
                            <a href=""><i class="fas fa-angle-right me-2"></i>${footCList }</a>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
</body>
</html>