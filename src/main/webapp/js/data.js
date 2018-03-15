// // scoreBoardA 积分榜
// // shooterBoardA 射手榜
// // assistBoardA 助攻榜
// // scheduleBoardA 赛程榜
// $("#scoreBoardA").on('click', function () {
//     loadData(1, 1)
// })
// $("#shooterBoardA").on('click', function () {
//     loadData(1, 2)
// })
// $("#assistBoardA").on('click', function () {
//     loadData(1, 3)
// })
// $("#scheduleBoardA").on('click', function () {
//     loadData(1, 4)
// })
//
// //加载数据 参数 比赛类型 板类型
// function loadData(gameType, boardType) {
//     console.log(boardType == 1)
//     if (boardType == 1) {
//         $("#scoreBoardDiv").show()
//         $("#shooterBoardDiv").hide()
//         $("#assistBoardDiv").hide()
//         $("#scheduleBoardDiv").hide()
//     } else if (boardType == 2) {
//         $("#scoreBoardDiv").hide()
//         $("#shooterBoardDiv").show()
//         $("#assistBoardDiv").hide()
//         $("#scheduleBoardDiv").hide()
//     } else if (boardType == 3) {
//         $("#scoreBoardDiv").hide()
//         $("#shooterBoardDiv").hide()
//         $("#assistBoardDiv").show()
//         $("#scheduleBoardDiv").hide()
//     } else if (boardType == 4) {
//
//     } else {
//         return
//     }
// }
