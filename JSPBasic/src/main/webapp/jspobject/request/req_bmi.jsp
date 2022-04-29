<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strCm = request.getParameter("cm");
	String strKg = request.getParameter("kg");
	// 위의 cm, kg을 double 자료형으로 바꿔서 출력해주세요.
	// strCm => 변수명 : m(cm / 100), strKg => 변수명 kg(kg 그대로)
	double cm = Double.parseDouble(strCm) / 100;
	int kg = Integer.parseInt(strKg);
	
	double bmi = kg / (cm * cm);
	
	if (bmi > 23) {
		out.println("당신은 과체중입니다.<br/>");
	} else if (bmi < 18.5) {
		out.println("당신은 저체중입니다.<br/>");
	} else {
		out.println("당신은 정상체중입니다.<br/>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	* 폼에서 보내는 데이터 받기
	1. #으로 했던 목적지를 req_bmi.jsp로 해주세요(서버 실행후 브라우저창 주소 복붙하면 됨)
	2. 스크립트릿을 이용해 req_bmi_form.jsp에서 보내는 데이터를 받아 자바 데이터로 저장해주세요.
	3. 받아온 값을 화면에 출력해주세요.
	
	bmi지수 공식 [체중(kg) / (신장(m) * 신장(m))]
	* bmi지수가 23을 초과한다면 "당신은 과체중입니다."를 출력,
	18.5 미만이라면 "당신은 저체중입니다."를 출력,
	나머지는 "당신은 정상체중입니다."를 출력해주세요.
--%>
키 : <%= strCm %> cm<br/>
체중 : <%= strKg %> kg<br/>
BMI : <%= bmi %><br/>
</body>
</html>