// window.onload = function () {
//     var timer = setInterval(showTime, 1)
// }
//
// function showTime() {
//     var now = new Date();
//     //此处为记录开始的时间
//     var then = new Date("2018/1/21 15:30:00");
//     var time = now - then;
//     var year = parseInt(time / (3600 * 1000 * 24 * 365));
//     var day = parseInt(time % (3600 * 1000 * 24 * 365) / (3600 * 1000 * 24));
//     var second = parseInt((time % (3600 * 1000 * 24 * 365) % (3600 * 1000 * 24)) / 1000);
//     var ms = (time % (3600 * 1000 * 24 * 365) % (3600 * 1000 * 24)) % 1000;
//     var s = document.getElementById("timer");
//     s.innerHTML = '爱的计时：' + year + '年' + day + '天' + second + '秒'
// }
//比赛倒计时
var count = 0
var timer = 0
var clickStart = 0
$(function () {

    var nowTime = new Date().Format("yyyy/MM/dd HH:mm:ss")
    // var endTime = '2018/03/23 18:19:00'
    var endTime = nowTime
    $(".count_down").countDown({
        startTimeStr: nowTime,//开始时间
        endTimeStr: '2018/03/23 18:19:00',//结束时间
        daySelector: ".day_num",
        hourSelector: ".hour_num",
        minSelector: ".min_num",
        secSelector: ".sec_num"
    });

    if (nowTime = endTime) {
        $('.count_down').hide()
        $('.game-time').css('display', 'block')
        startGame()
    }

})


//比赛开始计时
function startGame() {
    var txt = $(".game-start")
    timer = setInterval(function () {
            var m = parseInt(count / 1000 / 60) % 60;
            var s = parseInt(count / 1000) % 60;
            m = m < 10 ? '0' + m : m;
            s = s < 10 ? '0' + s : s;
            txt.text(m + '分' + s + '秒')
            count += 10;
        }
        , 10)
    clickStart++
}

//暂停比赛
function pauseGame() {
    console.log(clickStart)
    if (clickStart % 2 == 0) {
        startGame()
    } else {
        clearInterval(timer)
        clickStart = 0
    }
}