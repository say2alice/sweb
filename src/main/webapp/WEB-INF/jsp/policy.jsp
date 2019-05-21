<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: KIMKT
  Date: 2017-04-07
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="head.jsp"/>
<div id="wrap">
<div class="policy">
    <c:if test="${policy == 'privacy'}">
    <h2>개인정보 취급 방침</h2>
    '막이슈'은 (이하 '회사'는)
    고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.


    회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

    ο 본 방침은 : 2017 년 04 월 1 일 부터 시행됩니다.

    ■ 수집하는 개인정보 항목

    회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.


    ο 수집항목 : 로그인ID, 비밀번호, 접속 IP
    ο 개인정보 수집방법 : 홈페이지(회원가입)

    ■ 개인정보의 수집 및 이용목적

    회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다..

    ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
    콘텐츠 제공
    ο 회원 관리
    가입 의사 확인

    ■ 개인정보의 보유 및 이용기간

    원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.

    보존 항목 : 이름 , 성별 , 로그인ID , 이메일 , 접속 로그 , 쿠키 , 접속 IP 정보
    보존 근거 : 서비스이용을 위하여 계속보존
    보존 기간 : 탈퇴하기 전까지

    ■ 개인정보의 파기절차 및 방법

    회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.


    ο 파기절차

    회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.

    별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.

    ο 파기방법

    - 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

    ■ 개인정보 제공

    회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.

    - 이용자들이 사전에 동의한 경우

    - 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

    ■ 수집한 개인정보의 위탁

    회사는 고객님의 동의없이 고객님의 정보를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.

    ■ 이용자 및 법정대리인의 권리와 그 행사방법

    이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만
    아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니
    다.
    이용자 혹은 만 14세 미만 아동의 개인정보 조회?수정을 위해서는 ‘개인정보변
    경’(또는 ‘회원정보수정’ 등)을 가입해지(동의철회)를 위해서는 “회원탈퇴”를 클릭
    하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.
    혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조
    치하겠습니다.
    귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까
    지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자
    에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이
    이루어지도록 하겠습니다.
    oo는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “oo
    가 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의
    용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

    ■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항

    회사는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 oo의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 회사은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.

    ▶ 쿠키 등 사용 목적
    - 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공

    귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.

    ▶ 쿠키 설정 거부 방법
    예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.

    설정방법 예(인터넷 익스플로어의 경우)
    : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보

    단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.

    표시/광고에 관한 기록 : 6개월 (전자상거래등에서의 소비자보호에 관한 법률)
    계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
    대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
    소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)
    신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 (신용정보의 이용 및 보호에 관한 법률)
    </c:if>
    <c:if test="${policy == 'service'}">
        <h2>이용약관</h2>
        회원 가입 약관 제1조(목적)
        이 약관은 막이슈(이하 "회사"라 한다)가 운영하는 웹사이트(이하 "웹"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 회원의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.

        제2조(정의)
        ① "웹" 이란 "회사"가 재화 또는 용역을 "회원"에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 웹을 운영하는 주체의 의미로도 사용합니다.
        ② "이용자"란 "웹"에 접속하여 이 약관에 따라 "웹"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
        ③ "회원"이라 함은 "웹"에 개인정보를 제공하여 회원등록을 한 자로서, "웹"의 정보를 지속적으로 제공받으며, "웹"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
        ④ "비회원"이라 함은 회원에 가입하지 않고 "웹"이 제공하는 서비스를 이용하는 자를 말합니다.


        제3조 (약관의 명시와 개정)
        ① "웹"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 웹의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.
        ② "웹"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 회원이 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 '웹"에 송신하여 "회사"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
        ③ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다.


        제4조(서비스의 제공 및 변경)
        ① "웹"은 다음과 같은 업무를 수행합니다.
        1.
        2. 기타 "웹"이 정하는 업무

        제5조(서비스의 중단)
        ① "웹"은 컴퓨터 등 정보통신설비의 보수점검•교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
        ② 제1항에 의한 서비스 중단의 경우에는 "웹"은 제8조에 정한 방법으로 회원에게 통지합니다.


        제6조(회원가입)
        ① 이용자는 "웹"이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
        ② "웹"은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.
        1. 등록 내용에 허위, 기재누락, 오기가 있는 경우
        2. 기타 회원으로 등록하는 것이 "웹"의 기술상 현저히 지장이 있다고 판단되는 경우

        제7조(회원 탈퇴 및 자격 상실 등)
        ① 회원은 "웹"에 언제든지 탈퇴를 요청할 수 있으며 "웹"은 즉시 회원탈퇴를 처리합니다.
        ② 회원이 다음 각호의 사유에 해당하는 경우, "웹"은 회원자격을 제한 및 정지시킬 수 있습니다.
        1. 가입 신청시에 허위 내용을 등록한 경우
        2. 다른 사람의 "웹" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우
        3. "웹"을 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

        제8조(회원에 대한 통지)
        ① "웹"이 회원에 대한 통지를 하는 경우, 회원이 "웹"에 제출한 전자우편 주소로 할 수 있습니다.
        ② "웹"은 불특정다수 회원에 대한 통지의 경우 1주일이상 "웹" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다.

        제9조(개인정보보호)
        ① "웹"은 회원의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다.
        ② "웹"이 회원의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 회원의 동의를 받습니다.
        ③ 제공된 개인정보는 당해 회원의 동의없이 목적외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 "웹"이 집니다. 다만, 다음의 경우에는 예외로 합니다.
        1. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
        ④ "웹"이 제2항과 제3항에 의해 회원의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받는자, 제공목적 및 제공할 정보의 내용)등 정보통신망이용촉진등에관한법률 제16조제3항이 규정한 사항을 미리 명시하거나 고지해야 하며 회원은 언제든지 이 동의를 철회할 수 있습니다.
        ⑤ 회원은 언제든지 "웹"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "웹"은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. 회원이 오류의 정정을 요구한 경우에는 "웹"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
        ⑥ "웹"은 개인정보 보호에 최선을 다하며, 개인정보의 보호 및 사용에 대해서는 관련법령 및 '웹'의 개인정보보호정책이 적용됩니다. 다만, '웹'은 회원의 귀책사유로 노출된 정보에 대해 일체의 책임을 지지않습니다.
        ⑦ "웹" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다.

        제10조(회원의 ID 및 비밀번호에 대한 의무)
        ① 제15조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
        ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
        ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "웹"에 통보하고 "웹"의 안내가 있는 경우에는 그에 따라야 합니다.

        제11조(회원의 의무)
        회원은 다음 행위를 하여서는 안됩니다.
        1. 신청 또는 변경시 허위내용의 등록
        2. "웹"에 게시된 정보의 변경
        3. "웹"이 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시
        4. "웹" 기타 제3자의 저작권 등 지적재산권에 대한 침해
        5. "웹" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
        6. 외설 또는 폭력적인 메시지•화상•음성 기타 공서양속에 반하는 정보를 "웹"에 공개 또는 게시하는 행위

        제12조(사이트 간의 링크 관계)
        ① 상위 사이트와 하위 사이트 상호간 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 웹사이트라고 하고 후자를 피연결 웹사이트라고 한다.
        ② 연결 웹사이트는 피연결 웹사이트가 독자적으로 제공하는 재화•용역에 의해서 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결 웹사이트에서 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.

        제13조(저작권의 귀속 및 이용제한)
        ① "웹"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "웹"에 귀속합니다.
        ② 회원은 "웹"을 이용함으로써 얻은 정보를 "웹"의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.

        제14조("웹"의 의무)
        ① "웹은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화•용역을 제공하는 데 최선을 다하여야 합니다.
        ② "웹"은 회원이 안전하게 인터넷 서비스를 이용할 수 있도록 회원의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.

        제15조(분쟁해결)
        ① "웹"은 회원으로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 회원에게 그 사유와 처리일정을 즉시 통보해 드립니다.
        ② "웹"과 회원간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.

        제16조(재판권 및 준거법)
        ① "웹"과 회원간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다.
        ② "웹"과 회원간에 제기된 전자거래 소송에는 한국법을 적용합니다.

        [부 칙]
        1. (시행일) 이 약관은 2017년 4월 01일부터 시행합니다
    </c:if>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>