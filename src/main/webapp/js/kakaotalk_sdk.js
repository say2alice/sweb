/**
 * Created by KIMKT on 2017-02-21.
 */
    Kakao.init('639d06cb8d3b87dca7497bf4c0d4f4ef');

    function sendLink(title, img, callback) {
    Kakao.Link.sendTalkLink({
        label: title,
        image: {
            src: img,
            width: '300',
            height: '200'
        }
        ,
        webButton: {
            text: '자세히 보기',
            url : $(location).attr('href')
        }
        ,
        fail: checkMobile()
    });
}
function checkMobile(){
    var filter = "win16|win32|win64|mac|macintel";
    if ( navigator.platform  ) {
        if ( filter.indexOf( navigator.platform.toLowerCase() ) >= 0 ) {
            alert("모바일에서만 가능합니닼");
        }
    }
}