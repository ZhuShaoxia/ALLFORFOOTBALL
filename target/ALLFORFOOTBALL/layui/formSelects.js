//拓展layui的多选功能
layui.define(function(exports) {
	var $ = layui.jquery || $, form = layui.form;
	var obj = {
		array: {},
		selects: function(options) {
			if(!layui.jquery && !$) {
				commons.log(' %c 需要引入jquery模块, 或单独使用jquery', 'color: red;');
				return;
			}
			this.array[options.name] = {
				data: []
			}
			var dataArr = this.array[options.name].data;
			this.array[options.name].options = options = $.extend({}, commons.STANDARD_OPTIONS, options);
			commons.log("当前配置: ", options);
			commons.log("已配置数据配置: ", this.array);
			var res = commons.init(dataArr, options);
			if(res == 1) {
				return ;
			}
			form.on(options.model + '(' + options.filter + ')', function(data) {
				if(options.model == 'checkbox'){
					if(data.elem.checked){
						commons.push(dataArr, data.othis);
					}else{
						commons.remove(dataArr, commons.findval(data.othis));
					}
				}else{
					if(!data.value){
						commons.selectShow(dataArr, options);
						return ;
					}
					var $info = $(data.othis).find('dd[lay-value='+data.value+']');
					var val = commons.findval($info);
					if(commons.remove(dataArr, val)){//删除成功
										
					}else{
						commons.push(dataArr, $info);
					}
					options.$dom.find('dl').css('display', 'block');
					commons.selectShow(dataArr, options);
				}
				commons.show(dataArr, options);
			});
		},
		debug: function (flag){
			commons.isDebug = true && flag;
		},
	};

	var commons = {
		STANDARD_OPTIONS: {
			model: 'select',
			filter: '',
			show: '',
			left: '【',		
			right: '】',	
			separator: '',
		},
		isDebug: false,
		init: function(arr, options){
			var checks, $option = $(options.el);
			if($option.is('input')){
				checks = $option.parent().find('.layui-form-checked');
			}else if($option.is('select')){
				var $dom = options.$dom = $option.next();
				$dom.find('dl').css('display', 'none');
				$(document).on('click', options.el + ' + div input', function(){
					commons.selectShow(arr, options);
				});		
				$(document).on('click', 'body:not('+ options.el +' + div)', function(e){
					var showFlag = $(e.target).parents('.layui-form-select').prev().is($option);//.attr('lay-filter');
					var thisFlag = $dom.find('dl').css('display') == 'block';
					if(showFlag){//点击的input框
						$dom.find('dl').css('display', thisFlag ? 'none' : 'block');
					}else{
						if(thisFlag){
							$dom.find('dl').css('display', 'none');
						}
					}
				});
				
//				checks = $dom.find('dl .layui-this');
				checks = $option.find('option[selected]');
			}else{
				commons.log('传入的配置错误, 无法识别select或input[checkbox]', options);
				return 1;
			}
			for(var i = 0; i < checks.length; i++){
				commons.push(arr, checks[i]);
			}
			commons.log('初始化已选择元素: ', arr);
			commons.show(arr, options);
			if($option.is('select')){
				commons.selectShow(arr, options);
			}
			return 0;
		},
		findval: function(option){
			var $option = $(option);
			return $option.is('dd') ? {
				name: $option.text(),
				val : $option.attr('lay-value')
			} : ($option.is('option') ? {
				name: $option.text(),
				val : $option.attr('value')
			} : {
				name: $option.find('span').text(),
				val : $option.prev('input').val()
			});
		},
		push: function(arr, option){
			arr.push(commons.findval(option));
		},
		show: function(arr, options){
			if(options.show){
				$(options.show).text(JSON.stringify(arr));
			}else{
				commons.log(arr);
			}
		},
		selectShow: function(arr, options){
			options.$dom.find('.layui-this').removeClass('layui-this');
		  	var input_val = '';
		  	for(var i in arr){
		  		var obj = arr[i];
		  		input_val += options.separator + options.left + obj.name + options.right;
				options.$dom.find('dd[lay-value="'+obj.val+'"]').addClass('layui-this');							  			
		  	}
		  	if(options.separator && options.separator.length > 0 && input_val.startsWith(options.separator)){
		  		input_val = input_val.substr(options.separator.length);
		  	}
		  	options.$dom.find('.layui-select-title input').val(input_val);
		},
		indexOf: function(arr, val) {
			for(var i = 0; i < arr.length; i++) {
				if(arr[i] == val || JSON.stringify(arr[i]) == JSON.stringify(val)) {
					return i;
				}
			}
			return -1;
		},
		remove: function(arr, val) {
			var index = commons.indexOf(arr, val);
			if(index > -1) {
				arr.splice(index, 1);
				return true;
			}
			return false;
		},
		log: function(message, params) {
			if(commons.isDebug){
				if(message instanceof Array && !params){
					console.table(message)
					return ;
				}
				if(params instanceof Array){
					console.log(message);
					console.table(params)
					return ;
				}
				if(!params){
					console.log(message)
					return ;
				}
				console.log(message, params)
			}
		}
	}
	exports('formSelects', obj);
});