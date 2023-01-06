<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<style>
    .container{
        width: 200px;
        height: 300px;
        display: contents;
    }
    .insert-body {
        max-width: 700px;
    }
    .buyer-insert-header{
        width: 100%;
        height: 100%;
        text-align: center;
        margin-bottom: 30px;
        margin-top: 30px;
    }
    .form-name{
        text-align: right;
    }
    .form-text{
        float: left;
        text-align: left;
    }
    #productType{
        -webkit-appearance: button;
    }
    .rowdiv{
        justify-content: space-around;
    }
    .col-form-label{
        font-weight: 600;
    }
    
    #productNameExist {
    	line-height: 10px;
    	margin-top: 10px;
	    font-size: 15px; 
	    font-weight: 600; 
	    width: 60px; 
	    height: 30px; 
	    color: white; 
	    border-radius: 5px; 
	    background-color: white !important;
 		border-color: #1d5c83 !important;
 		color: #1d5c83 !important;
    }
    
    #productNameExist:hover {
 		background-color: #1d5c83 !important;
 		color: white !important;
 	}
    
    .registerBtn {
    	line-height: 10px;
    	float: right !important; 
	    text-align: center !important;
	    font-size: 15px; 
	    font-weight: 600; 
	    width: 60px; 
	    height: 30px; 
	    color: white; 
	    border: none; 
	    border-radius: 5px; 
	    background: #1d5c83;
	    margin-bottom: 25px;
    }
</style>
<body>   
    <div class="insert-body mt-5 ">
    	<form action="" method="post">
	        <div class="container-md">
	            <div class="row">
	                <div class="col mt-1">
	                    <div class="mb-4">
	                        <h1 style="font-size: 24px; font-weight:600">제품 등록</h1>
	                    </div>					
	                    <hr class="line" style="border: solid 1px #000" />
	                    </div>
	                    <div class="container-sm content-size">
	                    	<div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputCode" class="col-form-label">제품 코드</label>
	                            <div class="col-sm-5">
	                                <input id="productCode" name="productCode" type="text" class="form-control" placeholder="제품코드를 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">제품명</label>
	                            <div class="col-sm-5">
	                                <input id="productName" name="productName"  type="text" class="form-control" placeholder="제품명을 입력하세요."/>
	                                <button class="btn" type="button" id="productNameExist">확인</button>
	                            </div>
	                            <div id="productNameText1" class="form-text">제품명 확인을 해주세요.</div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputProductType" class="col-form-label">제품 종류</label>
	                            <div class="col-sm-5">
	                                    <select id="productType" name="productType" class="form-control" style="padding-left: 8px;" >
	                                      <option selected>제품 종류를 선택 하세요.</option>
	                                      <option name="GATE 밸브">GATE 밸브</option>
	                                      <option name="GLOBE 밸브">GLOBE 밸브</option>
	                                      <option name="LUG 밸브">LUG 밸브</option>
	                                      <option name="SWING 밸브">SWING 밸브</option>
	                                      <option name="WAFER 밸브">WAFER 밸브</option>
	                                    </select>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">무게</label>
	                            <div class="col-sm-5">
	                                <input id="productWeight" name= "weight" type="text" class="form-control" placeholder="무게를 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">규격</label>
	                            <div class="col-sm-5">
	                                <input id="productSize" name="size" type="text" class="form-control" placeholder="규격을 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputProductPrice" class="col-form-label">원가</label>
	                            <div class="col-sm-5">
	                                <input id="productPrice" name="price" onkeyup="inputNumberFormat(this);" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"type="text" class="form-control" placeholder="원가를 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">단위</label>
	                            <div class="col-sm-5">
	                                <input id="productUnit" name="unit" type="text" class="form-control" placeholder="제품단위를 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">제품 설명</label>
	                            <div class="col-sm-5">
	                                <input id="productContent" name="content" type="text" class="form-control" placeholder="제품설명을 입력하세요."/>
	                            </div>
	                        </div>                   
	                    </div>
	                <hr />
	                <div>
	                    <input id="registerBtn" class="btn registerBtn" type="submit" value="등록"/>
	                </div>
	              
	            </div>
	        </div>
    	
    	</form>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script>
    const ctx = "${pageContext.request.contextPath}";
    
    var availableProductName = false;
    
    function enableSubmitButton() {
    	const button = document.querySelector("#registerBtn");
    	if (availableProductName) {
    		button.removeAttribute("disabled")
    	} else {
    		button.setAttribute("disabled", "");
    	}
    }
    
  //ProductName input 변경시 submit 버튼 비활성화
    document.querySelector("#productName").addEventListener("keyup", function() {
    	availableProductName = false;
    	enableSubmitButton();
    });    

    //제품명 중복확인
    document.querySelector("#productNameExist").addEventListener("click", function() {
    	availableProductName = false;
    	// 입력된 제품명을
    	const productName = document.querySelector("#productName").value;
    	
    	// fetch 요청 보내고
    	fetch(ctx + "/master/existproductName/" + productName)
    		.then(res => res.json())
    		.then(data => {
    			// 응답 받아서 메세지 출력
    			document.querySelector("#productNameText1").innerText = data.message;
    			
    			if (data.status == "not exist") {
    				availableProductName = true;
    				enableSubmitButton();
    			}
    		}); 
    	
    });
    
    
        function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        }

        function uncomma(str) {
            str = String(str);
            return str.replace(/[^\d]+/g, '');
        } 
        
        function inputNumberFormat(obj) {
            obj.value = comma(uncomma(obj.value));
        }
        
        function inputOnlyNumberFormat(obj) {
            obj.value = onlynumber(uncomma(obj.value));
        }
        
        function onlynumber(str) {
            str = String(str);
            return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
        }
    </script>

</body>
</html>