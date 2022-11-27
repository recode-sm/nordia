/* 
2018.07.10 JS 통합작업

#########################################################
* 합쳐지는 파일
#########################################################
1. /script/bannerpop.js			9개
2. /script/resizePhoto.js		5개
3. /script/floating.banner.js	2개
4. /script/mosaic.js			6개
5. /script/newsAutoCall.js		2개
6. /script/common.js			8개
7. /script/app.js				49개

=> /script/common.js 로 통합
##########################################################
*/

/* ****************************************** */
/* /script/bannerpop.js						  */
/* ****************************************** */

var adWrite={
	// php 전달 변수
	vars:{
		separator : "|"
		,editId : null												// 수정할 id
		,box : '<div class="ad-map" />'					// 생성된 박스
		,buttons : '<div class="ad-map-btns"><div class="btn-group-vertical"><button type="button" class="btn_com btn_com_0_699 adcmb_button adcmb_modify button secondary tiny" title="수정"><i class="icon-link"></i></button><button type="button" class="btn_com btn_com_35_699 adcmb_button adcmb_delete button tiny nd-gray" title="삭제"><i class="icon-trash-o"></i></button></div></div>'		//생선된 박스의 버튼들
		,$textBox : null
		,act : ""												// 사진 업로드하고 이러저하게 자주 act값이 바뀌는데, 그것의 원래 값
		,iframe : '<iframe src="about:blank" name="adc_up_frame" id="adc_up_frame" width="0" height="0" frameborder="0"></iframe>'	// upload용 iframe
		,loadData : {}	
	}

	// 이미지 로딩되면 크기 재어오기
	// IE만 이미지 로딩된후 이벤트가 먹어져서 크기를 제대로 재어오지 못해서 inline으로 스크립트 작성함
	,getSizeLoadImage:function(_this)
	{
		var _w = _this.width
			,_h = _this.height;
		
		_this.setAttribute("data-display-width", _w);
		_this.setAttribute("data-display-height", _h);

		// 이미지맵 이벤트
		adWrite.map($(_this));
	}

	// 등록시 이벤트들
	,evtCrtForm:function()
	{	
		var parents = this
			,$type = $("#adc_crt_type_html, #adc_crt_type_file")
			,$htmlBox = $("#adc_crt_html_box")
			,$fileBox = $("#adc_crt_attach_file_box")
			
			,$popupType = $("#adc_crt_popup_type_layer, #adc_crt_popup_type_window")
			,$layer = $("#adc_crt_popup_layer_opt_box")
			,$window = $("#adc_crt_popup_window_opt_box")
			
			,$closeIcon = $("#adc_crt_popup_layer_icon")
			,$iconBox = $("#adc_crt_popup_layer_icon_box")

			,$closeExpire = $("#bottom_close_expire_label")
			,$closeExpireBox = $("#bottom_close_expire_box")

			,$attachFile = $("#adc_crt_attach_file")
			,$previewFile = $("#adc_crt_file_image")
			,$previewBox = $("#adc_crt_image_preview_box")
			
			,$max_file_size = $("#file_upload_max_size").val();
		
		// 입력부분 담아두기
		this.vars.$textBox = $("#adc_crt_image_link_box");

		// html, file 입력
		$type.click(function(){
			var isChecked = $(this).attr("value");

			$htmlBox[isChecked==="HTML"?"removeClass":"addClass"]("is-hidden");
			$fileBox[isChecked==="FILE"?"removeClass":"addClass"]("is-hidden");
		});

		// 미리보기 호출 //
		$attachFile.change(function(){
			var form = document.adc_form;

			if (typeof (FileReader) != "undefined") {

				var file = $(this)[0].files[0]
					,regex = ['jpg', 'jpeg', 'png', 'gif', 'swf']
					,filesize = file.size
					,extension = file.name.split('.').pop().toLowerCase();

				if(filesize > $max_file_size){
					alert('업로드 용량이 초과되었습니다.');
					$attachFile.val("");
					return false;
				}
				
				if((regex.indexOf(extension) > -1) === false){
					alert('jpg, png, gif, swf 확장자만 선택하여 주세요.');
					$attachFile.val("");

					//입력시만 함정발동 예정
					$previewBox.addClass("is-hidden");
					return false;
				}

				if(extension == "swf"){
					$previewBox.addClass("is-hidden");
					return false;
				}
			
				var reader = new FileReader();
				reader.onload = function (e) {
					var img = new Image();
					img.src = e.target.result;

					img.onload = function(){
						$previewFile.attr({"src":e.target.result,"data-display-width":this.width, "data-display-height":this.height, "data-width":this.width, "data-height":this.height, "alt":(form.title.value)?form.title.value:form.idxno.value});
						$previewBox.removeClass("is-hidden");
						
						// 이미지가 실제사이즈가 보이는 사이즈보다 크면 다시 보이는 사이즈를 넣자
						if(this.width > $previewFile.width()) {
							$previewFile.attr({"data-display-width":$previewFile.width(), "data-display-height":$previewFile.height()});	
						}
						
						$('#size_width').val(this.width);
						$('#size_height').val(this.height);
		
						$('#popup_width').val(this.width);
						$('#popup_height').val(this.height);

						// 이미지맵 이벤트
						parents.map($previewFile);
					}
				}

				reader.readAsDataURL(file);
				parents.mapDeleteAll();
			}
		});

		var $mapRadio = $("#adc_crt_image_link_total, #adc_crt_image_link_part, #adc_crt_image_link_not")
			,$imgLinkSelect = $(".adcil_btns")
			,$imgLink = $("#adc_crt_image_link")
			,$imgLinkFile = $("#adc_crt_image_link_file")
			,$selectPopup = $("#adc_crt_image_link_popup")		
			,$btnMapRegist = $("#adc_crt_img_link_btn_regist")
			,$linkAction = '';

		// 전체 또는 이미지 맵 선택시
		$mapRadio.click(function(){
			var $this = $(this)		
				,type = $this.attr("data-type");

			if(type == 'total' || type == 'map'){
				
				//if(type == 'map') $('#link_event_tag').hide();
                //else $('#link_event_tag').show();

				$("#adc_crt_image_link_box").removeClass('is-hidden');

				$btnMapRegist[type==="map"?"removeClass":"addClass"]("is-hidden");
				
				if(type==="total") parents.mapDeleteAll();									// 전체선택일때, 이전 데이타 모두 지움
				
			}else{
				$("#adc_crt_image_link_box").addClass('is-hidden');
			}
		});

		// layer or window 선택
		$popupType.click(function(){
			var isChecked = $(this).attr("data-type");

			$layer[isChecked==="layer"?"removeClass":"addClass"]("is-hidden");
			$window[isChecked==="window"?"removeClass":"addClass"]("is-hidden");
		});
		
		// 닫기 아이콘 클릭시 아이콘 형태 선택 박스 열게
		$closeIcon.click(function(){
			var $label_attr_for = $(this).attr('for')
				,isChecked = $('#'+$label_attr_for).is(":checked");

			$iconBox[isChecked===false?"removeClass":"addClass"]("is-hidden");
		});
		
		// 몇일 동안 열지 않기 입력박스 열기
		$closeExpire.click(function(){
			var $label_attr_for = $(this).attr('for')
				,isChecked = $('#'+$label_attr_for).is(":checked");

			$closeExpireBox[isChecked===false?"removeClass":"addClass"]("is-hidden");
		});

		// 어떤형태의 링크인지 확인
		// link, popup, file, close, day_close
		$imgLinkSelect.click(function(){
			var $this = $(this)
				,type = $this.attr("data-type");
			
			if(type==="popup" || type==="close" || type==="day_close"){
				$imgLink.add($imgLinkFile).addClass("is-hidden");
				$selectPopup[type==="popup"?"removeClass":"addClass"]("is-hidden");
			}else{
				$imgLink[type==="link"?"removeClass":"addClass"]("is-hidden");
				$imgLinkFile[type==="link"?"addClass":"removeClass"]("is-hidden");
				$selectPopup.addClass("is-hidden");
			}
		});

		$btnMapRegist.click(function(){

			// 맵 등록 수정
			var $popupSelect = $("#adc_crt_image_link_popup_select")
				,$linkText = $("#adcil_link_text")
				,$etcFile = $("#adcilf_attach")
				,$linkTarget = $(".adcil_btns_link option:selected");

			if(!parents.vars.editId){
				alert('이미지에서 수정할 맵데이타를 선택하여주세요.');
				return false;
			}

			// close, day_close 모두 등록 눌러야 저장되게...안그럼 radio클릭만으로 이전 정보 자체를 날려버림
			var type = $(".adcil_btns:checked").attr('data-type')
				,url = ""
				,target = "";
			
			if(!type) return false;
			if(type==="link"){
				url = $linkText.val();
				if(!url){
					alert('링크를 입력하여 주세요.');
					$linkText.focus();
					return false;
				}
				
				target = $linkTarget.val();
			}else if(type==="popup"){
				url = $popupSelect.val();
				if(!url){
					alert('팝업을 선택하여 주세요.')
					$popupSelect.focus();
					return false;
				}
			}else if(type==="file"){
				if(!$etcFile.val()){
					alert('파일을 선택하여 주세요.');
					$etcFile.focus();
					return false;
				}
				
				parents.uploadAttachTmpFile();
				
				return false;
			}
			
			parents.insertData({
									type:type
									,url:url
									,target:target
								})
			return false;
		});
	}
	
	// 이미지맵의 파일일때 저장 
	,uploadAttachTmpFile:function()
	{
		var parents = this
			,iframe = this.vars.iframe
			,form = document.adc_form;
		
		$(document.body).append(iframe);
		
		form.action = "/bannerpop/upload_act.php";
		form.target = "adc_up_frame";
		form.submit();
	}
	
	// 이미지맵의 임시파일저장후 리턴 값
	,afterUploadAttachTmpFile:function(result)
	{
		// 성공이던 아니던 폼은 일단 초기화함
		this.releaseForm();
		$("#adc_up_frame").remove();

		var json = $.parseJSON(adWrite.rawurldecode(result))
			,filename = json[0].filename;

		if(!filename){
			alert('업로드시 에러가 발생했습니다. 다시 업로드하여 주세요.');
			return false;
		}

		this.insertData({type:"file",url:filename,target:"self",json_obj:result});
	}

	//rawurldecode
	,rawurldecode:function(str) {
		return decodeURIComponent((str + '')
			.replace(/%(?![\da-f]{2})/gi, function() {
				return '%25';
			}));
	}

	// 이미지맵 입력폼 초기화
	,initInsertForm:function(data)
	{
		var parents = this
			,type = data.type||"link"
			,$btns = $(".adcil_btns")
			,$imgLink = $("#adc_crt_image_link")
			,$imgLinkFile = $("#adc_crt_image_link_file")
			,$selectPopup = $("#adc_crt_image_link_popup")
			,$filebox = $("#adcilf_uploaded_file");
		
		//$btns.filter("[data-type='"+type+"']").prop("checked", true);
		$btns.filter("[data-type='"+type+"']").click(); // 커스텀 radio box 라서 이렇게 처리 
		$filebox.hide();
		
		if(type==="popup" || type==="close" || type==="day_close"){
			$imgLink.add($imgLinkFile).addClass("is-hidden");
			$selectPopup[type==="popup"?"removeClass":"addClass"]("is-hidden");
			
			if(type==="popup") $("#adc_crt_image_link_popup_select").val(data.url);
			
		}else{			
			$imgLink[type==="link"?"removeClass":"addClass"]("is-hidden");
			$imgLinkFile[type==="link"?"addClass":"removeClass"]("is-hidden");
			$selectPopup.addClass("is-hidden");
			
			if(type==="link"){
				$(".adcil_btns_link option[value="+(data.target||"blank")+"]").prop("selected", true);
				$("#adcil_link_text").val(data.url)
			}else if(type==="file"){
				var $attach = $("#adcilf_attach")
					,$delBtn = $("#adcilfuf_btn")
					,$filename = $("#adcilfuf_file")
					,$fmode = $filename.attr('data-type');
				
				$attach.replaceWith($attach.clone());
				
				if(data.url){
					// 파일삭제
					$filebox.show();
					$filename.html(data.url);
					$delBtn.unbind("click").on("click", function(){
						if(confirm("서버에서 파일이 바로 제거됩니다.\n그래도 삭제하시겠습니까?")) {
						var file = data.url
							,extension = file.split('.').pop().toLowerCase()
							,filename = file.replace('.'+extension,'');

						$.post(SITE_DOMAIN + "/bannerpop/upload_act.php"
								,{mode:'dlt', fmode:$fmode, idxno:document.adc_form.idxno.value||"", filename:file}
								,function(data,rst){
									if(rst==="success"){
										if(data.result==="success"){
											$filename.empty();
											$filebox.hide();
											parents.insertData({type:"file", url:"", target:"", json_obj:""}, "no");
											//alert(decodeURIComponent(data.msg));
										}else alert(decodeURIComponent(data.msg));
									}else alert('생성할 수 있는 탭 제한수를 초과하였습니다.');
								},"json");
						}
					});
				}
			}
		}
	}
	
	// 상위폼 초기화
	,releaseForm:function(form)
	{
		if(!form) form = document.adc_form;
	
		// 해제
		form.action = this.vars.act;
		form.target = "";
	}
	
	// 데이타 얻어오기
	,getHiddenData:function()
	{
		var $id = $("#input_"+this.vars.editId)
			,val = $id.val().split(this.vars.separator);
		
		return {id:$id, val:val};
	}
		
	// input type 에 넣음
	,insertData:function(data, isInit)
	{
		if(!data) data={};
		if(!this.vars.editId) return false;
		if(!isInit) isInit = "ok";
		
		var $data = this.getHiddenData()
			,$id = $data.id
			,val = $data.val;
		
		if(val.length<=0) return false;

		val.splice(4, 4, data.type, data.url, data.target, (data.type == 'file' && data.url) ? data.json_obj : '')
		var value = val.join(this.vars.separator);
		
		$id.val(value);
		
		if(isInit==="ok") {
            //$("#link_event_tag").val("")
            this.initInsertForm({type:"link", url:"", target:"self"});
        }
		this.vars.editId = null;
		
		alert('적용되었습니다.');
	}
	
	// 수정폼
	,modifyForm:function(id)
	{
		if(!id) return false;
		this.vars.editId = id;
		
		var $data = this.getHiddenData()
			,val = $data.val
			,type = val[4]||"link"
			,url = val[5]||""
			,target = val[6]||"self";

		//이미지맵의 파일인지, 전체링크의 파일인지 구분짓기 위함
		$("#adcilfuf_file").attr('data-type', 'M' + (Number(this.vars.editId.replace(/[^0-9]/g,'')) + 1));

		this.initInsertForm({type:type, url:url, target:target});
		this.mapBlinkArea();
	}
	
	// 이미지 맵 잡기 위해 임시 저장
	,afterUploadTmpFile:function(json)
	{
		var form = document.adc_form
			,result = json.result||"error"
			,data = json.data||""
			,width = json.width||""
			,height = json.height||""
			,mime = json.mime||"";
		
		// 해제
		this.releaseForm(form);
		
		if(result === "error"){
			alert(data);
			return false;
		}
		
		// 나중에 폼 name으로 바꿀것!!!
		//$("#adc_crt_popup_size_width").val(width);
		//$("#adc_crt_popup_size_height").val(height);
		if(form.popup_width) form.popup_width.value = width;
		if(form.popup_height) form.popup_height.value = height;
		
		// 창 보이고, 이미지 미리보기 - 표시되는 사이즈 재오기
		$("#adc_crt_image_preview_box").show();
		$("#adc_crt_file_image").attr({"src":"data:"+mime+";base64,"+data, "data-width":width, "data-height":height});
		
		// 새로 올린것이니, 로딩된후 모든 이전에 저장된 맵 정보 날림
		// 이전 데이타 삭제
		this.mapDeleteAll();
	}
	

	// 비율대로 좌표 계산하기
	,mapCalcPositionRatio:function(val, ratio)
	{
		if(ratio === 1) return val;
		
		return Math.round(val * ratio);
	}
	
	// 비율대로 좌표 계산하기-축소
	,mapScalePositionRatio:function(val, ratio)
	{
		if(ratio === 1) return val;
		
		return Math.round(val / ratio);
	}
	
	/**
	 * input type="hidden" 생성
	 * id : string
	 * pos : object - 실제 위치
	 * kind : string -  링크,파일 등
	 * url : string - 링크, javascript function
	 * target : string - 현재창,새창,부모창
	 */
	,mapHidden:function($form, id, pos, kind, url, target)
	{
		var inputId = "input_"+id
			,val = [pos.x1, pos.y1, pos.x2, pos.y2, kind, url, target].join(this.vars.separator)
			,input = '<input type="hidden" name="link_url[]" id="'+inputId+'" class="adc_crt_image_map_data" value="'+val+'" />';
		
		$form.append(input);
	}
	
	// 생성된 맵 삭제
	,mapDelete:function(id)
	{
		var bId = "btn_"+id
			,inputId = "input_"+id;
		
		$("#"+id+",#"+bId+",#"+inputId).remove();
		this.initInsertForm({type:"link", url:"", target:"self"});
		alert('삭제되었습니다.');
	}
	
	// 생성된 맴 전체 삭제
	,mapDeleteAll:function()
	{
		$(".adc_crt_image_map_data, .ad-map, .ad-map-btns").remove();
	}
	
	// 입력부분 깜빡임
	,mapBlinkArea:function()
	{
		var parents = this;
		parents.vars.$textBox.addClass("ad-map-bg");
		setTimeout(function(){
			parents.vars.$textBox.removeClass("ad-map-bg")
		},500);
	}

	// 이미지 맵 잡기
	,map:function(target)
	{		
		var parents = this
			,$img = !!target.jquery ? target : $(target)
			,width = Number($img.attr("data-width"))||0							// 실제 사이즈
			,height = Number($img.attr("data-height"))||0
			,dWidth = Number($img.attr("data-display-width"))||0				// 표시 사이즈
			,dHeight = Number($img.attr("data-display-height"))||0
			,ratio = width>dWidth ? Number((width/dWidth).toFixed(1)) : 1		// 실제 사이즈가 표시된 사이즈보다 클경우 비율 맞추기 위해
			,box = parents.vars.box
			,buttons = parents.vars.buttons
			,$imgmapRadio = $("#adc_crt_image_link_part")
			,$imgmapBtnRegist = $("#adc_crt_img_link_btn_regist")
			,$form = $("#adc_form");

					
		return {
			exe:function()
			{
				this.canvas().loadData().addEvent();
			}
		
			// 덧붙이기
			,canvas:function()
			{
				$img.next("#adc_crt_edit_canvas").remove().end().after('<div id="adc_crt_edit_canvas" class="ad-canvas" style="left:'+$img.position().left+'px;width:'+dWidth+'px;height:'+dHeight+'px"></div>');
				return this;
			}
			
			// 로드된 맵 데이타에 따라 그리기
			,loadData:function()
			{
				var _parent = this
					,$input = $(".adc_crt_image_map_data")
					,$canvas = $("#adc_crt_edit_canvas");
				
				// 전체선택이라면
				if($input.length<=0){
					parents.initInsertForm(parents.vars.loadData);					
					return this;
				}
				
				//if($input.length>0) $('#link_event_tag').hide();
				
				// 이미지 맵 설정으로 수정
				$imgmapRadio.not(":checked").prop("checked", true);
				$imgmapBtnRegist.show();
				
				$.each($input, function(i,ele){
					var $ele = $(ele)
						,id = ele.id.replace("input_","")
						,val = $ele.val().split(parents.vars.separator)||[]
						,x1 = val[0]||0
						,y1 = val[1]||0
						,x2 = val[2]||0
						,y2 = val[3]||0
						,type = val[4]||"link"
						,url = val[5]||""
						,target = val[6]||"self";
					
					_parent.display($canvas, id, {x1:x1, y1:y1, x2:x2, y2:y2});					
				});
				
				return this;
			}
			
			// 영역 그림
			,display:function($canvas, id, data)
			{
				if(!data) data={};
				
				var $box = $(parents.vars.box)
					,$buttons = $(parents.vars.buttons)
					,offsetGap = $canvas.position().left||0			// 절대 좌표이기에 캔바스보다 작은 이미지일경우 gap만큼 더해서 표시해줌
					,bId = "btn_"+id
					,x1 = (Number(parents.mapScalePositionRatio(data.x1, ratio))+offsetGap)||0
					,y1 = parents.mapScalePositionRatio(data.y1, ratio)||0
					,x2 = (Number(parents.mapScalePositionRatio(data.x2, ratio))+offsetGap)||0
					,y2 = parents.mapScalePositionRatio(data.y2, ratio)||0
					,width = Math.abs(x1-x2)
					,height = Math.abs(y1-y2);
			
				// 버튼 만들기
				$buttons.css({"top":y1+"px", "left":x2+"px"}).attr({"id":bId})
				.find(".adcmb_button").click(function(){
					var $this = $(this)
						,isModify = $this.is(".adcmb_modify");
					
					if(isModify===true){
						parents.modifyForm(id);
					}else{
						parents.mapDelete(id);
					}
				});
				
				// box 만들기
				$box.css({"top":y1+"px", "left":x1+"px", "width":width, "height":height}).attr({"id":id});
				
				$canvas.after($box);
				$box.after($buttons);
								
				return this;
			}
						
			// event
			,addEvent:function()
			{
				var _this = this
					,position = {x:0, y:0}
					,$box = null
					,start = false;
				
				$(document.body).off("mousedown mousemove mouseup touchstart touchmove touchend","#adc_crt_edit_canvas")
				.on({
						"mousedown touchstart":function(event)
						{
							start = true;
							
							var $this = $(this)
								,evt = parents.getEventObject(window.event || event)
								,$evtTarget = $(evt.target||evt.srcElement)
								,offsetGap = $evtTarget.position().left									// 상대위치기 때문에 값 left 값을 더해줘야 함
								,x = Math.round(evt.offsetX||(evt.pageX-$evtTarget.offset().left))
								,y = Math.round(evt.offsetY||(evt.pageY-$evtTarget.offset().top))
								,id = "acem_"+new Date().getTime();
							
							position.x = x;
							position.y = y;
							
							$box = $(box).css({"top":y, "left":x+offsetGap}).attr({"id":id})
							$this.after($box);
							
							//evt.cancelBubble = true;
							//evt.stopPropagation();
							//evt.preventDefault();
						}
					
						,"mousemove touchmove":function(event)
						{							
							if(start === true){
								var evt = parents.getEventObject(window.event || event)
									,$evtTarget = $(evt.target||evt.srcElement)
									,offsetGap = $evtTarget.position().left									// 상대위치기 때문에 값 left 값을 더해줘야 함
									,x = Math.round(evt.offsetX||(evt.pageX-$evtTarget.offset().left))
									,y = Math.round(evt.offsetY||(evt.pageY-$evtTarget.offset().top))
									//,width = Math.abs(x-position.x)-5
									//,height = Math.abs(y-position.y)-5
									,width = Math.abs(x-position.x)
									,height = Math.abs(y-position.y)
									,css = {};
								
								css = {"width":width, "height":height};
								
								if(position.x>x && position.y>y){				// 좌상
									css.left = position.x-width+offsetGap;
									css.top = position.y-height;
								}else if(position.x>x && position.y<y){			// 좌하
									css.left = position.x-width+offsetGap;						
								}else if(position.x<x && position.y>y){			// 우상	
									css.top = position.y-height;
								}
								
								$box.css(css);
							}
						}
						
						,"mouseup touchend":function(event)
						{							
							start = false;
							
							// $box기준으로 x1,y1,x2,y2 가져옴
							var width = $box.width()
								,height = $box.height();
							
							if(width<20 && height<20){
								$box.remove();
								return false;
							}
							
							var	$buttons = $(buttons)
								,evt = parents.getEventObject(window.event || event)
								,$evtTarget = $(evt.target||evt.srcElement)
								,offsetGap = $evtTarget.position().left									// 상대위치기 때문에 값 left 값을 빼줘야지 진짜 맵이 됨
								,pos = $box.css(["top","left"])
								,x1 = parents.castIntFromCss(pos.left)
								,y1 = parents.castIntFromCss(pos.top)
								,id = $box.attr("id")
								,bId = "btn_"+id
								,inputId = "input_"+id
								,info = { x1 : x1, y1 : y1, x2 : x1 + width, y2 : y1 + height }
								,real = { x1 : parents.mapCalcPositionRatio(info.x1, ratio)-offsetGap, y1 : parents.mapCalcPositionRatio(info.y1, ratio), x2 : parents.mapCalcPositionRatio(info.x2, ratio)-offsetGap, y2 : parents.mapCalcPositionRatio(info.y2, ratio)};
							
							// 수정 삭제 이벤트
							$buttons.css({"top":info.y1, "left":info.x2}).attr({"id":bId})
							.find(".adcmb_button").click(function(){
								var $this = $(this)
									,isModify = $this.is(".adcmb_modify");

								if(isModify===true){
									parents.modifyForm(id);
								}else{
									parents.mapDelete(id);
								}
							});
							
							$box.after($buttons);
							parents.mapHidden($form, id, real, "", "", "");
							parents.initInsertForm({type:"link", url:"", target:"self"});									// 폼 초기화
							parents.vars.editId = id;
							
							// 이미지맵으로 체크
							$imgmapRadio.not(":checked").click().prop("checked", true);
							$imgmapBtnRegist.show();
							
							parents.mapBlinkArea();																			// 글쓰기 폼 이펙트
							
							//util.toast(lang.adcRequireLink);
						}
					},"#adc_crt_edit_canvas");
				
				return this;
			}
			
		}.exe();
	}

	// jquery 이벤트 등록 사용시, 이벤트 알아내기
	,getEventObject:function(e)
	{
		var evt = window.event||e;
			evt = evt.targetTouches?evt.targetTouches[0]:evt;  	// jquery touch event
		return evt;
	}
	
	// css px제거후 숫자형으로
	,castIntFromCss:function(v)
	{
		return Number(v.replace("px",""));
	}
	
	// list에서 버튼 이벤트
	,evtClickedButtons:function()
	{	
		// edit
		var edit_info = $('#admin-ad-list')
		,edit_section = edit_info.attr("data-edit-section")	
		,edit_area = edit_info.attr("data-edit-area")	
		,edit_step = edit_info.attr("data-edit-step")	
		,edit_idxno = edit_info.attr("data-edit-idxno")
		,edit_mode = edit_info.attr("data-edit-mode")
		,org_banner_kind = edit_info.attr("data-edit-org-banner-kind")
		,banner_kind = edit_info.attr("data-edit-banner-kind")
		,page = edit_info.attr("data-page")
		//,tmp_banner_idxno = edit_info.attr("data-edit-tmp-banner-idxno")
		,sc_area = edit_info.attr("data-search-scarea")
		,sc_word = encodeURIComponent(edit_info.attr("data-search-scword"))

		$(".ad-tile-toolkit, .content-inert").on("click", "button"
		, function(){
			var $this = $(this)
				,type = $this.attr("data-btn-type")
				,$parent = $this.closest(".adccfg_list_items")
				,bannerIdxno = $parent.attr("data-banner-idxno")
				,banner_type = $parent.attr("data-banner-type")
				,linkInfo = $parent.attr("data-link-info")
				,title = $.trim($parent.find(".acli_title").text())
				,state = $.trim($parent.find(".ad-tile-state").text())
				,Imgbp_Tag = $.trim($parent.find(".Imgbp_Tag").html());

			switch(type){
				case "add":
					if(banner_type == 'popup') {
						var data = {'mode':edit_mode,'section':edit_section,'popup_title':encodeURIComponent(title),'popup_idxno':bannerIdxno}
						adWrite.addEditPopupContents(data);
					}else{
						var data = {mode:edit_mode,'idxno':edit_idxno,'area':edit_area,'section':edit_section,'step':edit_step,'banner_title':encodeURIComponent(title),'banner_idxno':bannerIdxno,'kind':banner_kind,'edit_msg':'선택한 배너로 교체하시겠습니까?'};
						adWrite.addEditContents(data);
					}
					break;
				case "down":
					location.href = '/bannerpop/attach_down.php?idxno='+bannerIdxno+'&mode=O';
					break;
				case "linkInfo":					// 업로드된 파일 링크 복사					
					var source = '/bannerpop/uploads/image/'+linkInfo;
					adWrite.copyExe(source);
					break;
				case "sourceCopy":					// 소스복사
				/*if(state == '무제한') {
					if(!Imgbp_Tag) return false;
					var _html = '<!--'+title+'-->'
							  + Imgbp_Tag
							  + '<!--//'+title+'-->';	
				}else{*/
					var _time = new Date().getTime()
						,_html = '<!--'+title+'-->'
							   + '<script type="text/javascript">var ___BANNER = "ban_'+_time+'";</script>'
							   + '<script type="text/javascript" charset="utf-8" src="/bannerpop/uploads/js/'+bannerIdxno+'.js?'+_time+'" id="ban_'+_time+'"></script>'
							   + '<!--//'+title+'-->';
				//}
					
					adWrite.copyExe(_html);
				break;
				case "preview":
					if(!window.___popup) return false;
					
					var p = ___popup[bannerIdxno];

					if(!p) return false;
					if(!window.___currentTime) window.___currentTime = Math.floor(new Date().getTime()/1000);// 시간이 설정되지 않았다면 js 시간으로 설정함
					
					// 관리자만...										
					$(".layer_box").remove();				// 다른게 열려있다면 삭제
					bannerpop.vars.popup.view = "manager";
					bannerpop.float(p);
					break;
				case "mdf":
					var $ahref = '/bannerpop/';
					$ahref += edit_section ? 'edit.html' : 'write.html';
					$ahref += '?type='+banner_type+'&mode=modify&idxno='+bannerIdxno+'&page='+page;
					if(edit_section) $ahref += '&edit_section=' + edit_section;
					if(edit_area) $ahref += '&edit_area=' + edit_area;
					if(edit_step) $ahref += '&edit_step=' + edit_step;
					if(edit_idxno) $ahref += '&edit_idxno=' + edit_idxno;
					if(edit_mode) $ahref += '&edit_mode=' + edit_mode;
					//if(tmp_banner_idxno) $ahref += '&tmp_banner_idxno=' + tmp_banner_idxno;
					if(org_banner_kind) $ahref += '&org_banner_kind=' + org_banner_kind;
					if(banner_kind) $ahref += '&banner_kind=' + banner_kind;
					if(sc_area) $ahref += '&sc_area=' + sc_area;
					if(sc_word) $ahref += '&sc_word=' + sc_word;
					location.href = $ahref;
					break;
				case "del":
					if(window.confirm('삭제할까요?')) {	
						var $ahref = '/bannerpop/delete_act.php?type='+banner_type+'&idxno='+bannerIdxno+'&page='+page;
						if(edit_section) $ahref += '&edit_section=' + edit_section;
						if(edit_area) $ahref += '&edit_area=' + edit_area;
						if(edit_step) $ahref += '&edit_step=' + edit_step;
						if(edit_idxno) $ahref += '&edit_idxno=' + edit_idxno;
						if(org_banner_kind) $ahref += '&org_banner_kind=' + org_banner_kind;
						if(banner_kind) $ahref += '&banner_kind=' + banner_kind;
						if(sc_area) $ahref += '&sc_area=' + sc_area;
						if(sc_word) $ahref += '&sc_word=' + sc_word;
						location.href = $ahref;
					}
					break;
				case "mdf_activity":
					var $ahref = '/bannerpop/';
					$ahref += edit_section ? 'edit.html' : 'write_activity.html';
					$ahref += '?type='+banner_type+'&mode=modify&activity_idxno='+bannerIdxno+'&page='+page;
					if(edit_section) $ahref += '&edit_section=' + edit_section;
					if(edit_area) $ahref += '&edit_area=' + edit_area;
					if(edit_step) $ahref += '&edit_step=' + edit_step;
					if(edit_idxno) $ahref += '&edit_idxno=' + edit_idxno;
					if(edit_mode) $ahref += '&edit_mode=' + edit_mode;
					if(org_banner_kind) $ahref += '&org_banner_kind=' + org_banner_kind;
					if(banner_kind) $ahref += '&banner_kind=' + banner_kind;
					//if(tmp_banner_idxno) $ahref += '&tmp_banner_idxno=' + tmp_banner_idxno;
					if(sc_area) $ahref += '&sc_area=' + sc_area;
					if(sc_word) $ahref += '&sc_word=' + sc_word;
					location.href = $ahref;
					break;
				case "del_activity":
					if(window.confirm('삭제할까요?')) {	
						var $ahref = '/bannerpop/delete_activity_act.php?type='+banner_type+'&activity_idxno='+bannerIdxno+'&page='+page;
						if(edit_section) $ahref += '&edit_section=' + edit_section;
						if(edit_area) $ahref += '&edit_area=' + edit_area;
						if(edit_step) $ahref += '&edit_step=' + edit_step;
						if(edit_idxno) $ahref += '&edit_idxno=' + edit_idxno;
						if(org_banner_kind) $ahref += '&org_banner_kind=' + org_banner_kind;
						if(banner_kind) $ahref += '&banner_kind=' + banner_kind;
						if(sc_area) $ahref += '&sc_area=' + sc_area;
						if(sc_word) $ahref += '&sc_word=' + sc_word;
						location.href = $ahref;
					}
					break;				
				case "sourceCopy_activity":					// 소스복사
					var _time = new Date().getTime()
					,_html = '<!--'+title+'-->'
						   + '<script type="text/javascript">var ___BANNER = "ban_'+_time+'";</script>'
						   + '<script type="text/javascript" charset="utf-8" src="/bannerpop/uploads/js_activity/'+bannerIdxno+'.js?'+_time+'" id="ban_'+_time+'"></script>'
						   + '<!--//'+title+'-->';
					
					adWrite.copyExe(_html);
					break;
                case "mdf_multi":
                    var $ahref = '/bannerpop/';
                    $ahref += edit_section ? 'edit.html' : 'write_activity_multi.html';
                    $ahref += '?type='+banner_type+'&mode=modify&multi_idxno='+bannerIdxno+'&page='+page;
                    if(edit_section) $ahref += '&edit_section=' + edit_section;
                    if(edit_area) $ahref += '&edit_area=' + edit_area;
                    if(edit_step) $ahref += '&edit_step=' + edit_step;
                    if(edit_idxno) $ahref += '&edit_idxno=' + edit_idxno;
                    if(edit_mode) $ahref += '&edit_mode=' + edit_mode;
                    if(org_banner_kind) $ahref += '&org_banner_kind=' + org_banner_kind;
                    if(banner_kind) $ahref += '&banner_kind=' + banner_kind;
                    //if(tmp_banner_idxno) $ahref += '&tmp_banner_idxno=' + tmp_banner_idxno;
                    if(sc_area) $ahref += '&sc_area=' + sc_area;
                    if(sc_word) $ahref += '&sc_word=' + sc_word;
                    location.href = $ahref;
                    break;
                case "del_multi":
                    if(window.confirm('삭제할까요?')) {
                        var $ahref = '/bannerpop/delete_activity_multi_act.php?type='+banner_type+'&multi_idxno='+bannerIdxno+'&page='+page;
                        if(edit_section) $ahref += '&edit_section=' + edit_section;
                        if(edit_area) $ahref += '&edit_area=' + edit_area;
                        if(edit_step) $ahref += '&edit_step=' + edit_step;
                        if(edit_idxno) $ahref += '&edit_idxno=' + edit_idxno;
                        if(org_banner_kind) $ahref += '&org_banner_kind=' + org_banner_kind;
                        if(banner_kind) $ahref += '&banner_kind=' + banner_kind;
                        if(sc_area) $ahref += '&sc_area=' + sc_area;
                        if(sc_word) $ahref += '&sc_word=' + sc_word;
                        location.href = $ahref;
                    }
                    break;                
                case "sourceCopy_multi":
                    var _time = new Date().getTime()
                    ,_html = '<!--'+title+'-->'
                           + '<script type="text/javascript">var ___BANNER = "ban_'+_time+'";</script>'
                           + '<script type="text/javascript" charset="utf-8" src="/bannerpop/uploads/js_multi/'+bannerIdxno+'.js?'+_time+'" id="ban_'+_time+'"></script>'
                           + '<!--//'+title+'-->';
                    adWrite.copyExe(_html);
                    break;
			}

			return false;
		});
	}

	//수정시 섹션판 컨텐츠 삽입
	,addEditContents:function(data)
	{			
		//var flag = false;
		var flag = true;

		/*if(data.mode == 'modify') {
			if(data.tmp_banner_idxno != data.banner_idxno) {
				if(confirm(data.edit_msg)) flag = true;
				else flag = false;
			}else flag = true;
		}else flag = true;*/

		if(flag) { 			
			data = JSON.stringify(data);
			$.ajax({
				url:"/edit/adminReservationBannerWrite.php"
				,type:'post'
				,dataType:'json'
				,contentType:'application/x-www-form-urlencoded; charset=utf-8'
				,data:{post_data:data}
				,success:function(json, result) {
					if(result == 'success') {
						if(json.response == 'ok') { 
							window.parent.location.reload();
						}else{
							alert(json.msg);
							return false;
						}
					}else return false;
				}
			});
		}else{
			return false;
		}
	}

	//수정시 섹션판 컨텐츠 삽입
	,addEditPopupContents:function(data)
	{					
		data = JSON.stringify(data);
		$.ajax({
			url:"/edit/adminReservationPopupWrite.php"
			,type:'post'
			,dataType:'json'
			,contentType:'application/x-www-form-urlencoded; charset=utf-8'
			,data:{post_data:data}
			,success:function(json, result) {
				if(result == 'success') {
					if(json.response == 'ok') {
						//window.parent.location.reload();
						parent.$('#edit-modal').find('.close-button').trigger('click');
						adWrite.addPopupContentsList(json);
					}else{
						alert(json.msg);
						return false;
					}
				}else return false;
			}
		});
	}

	,addPopupContentsList:function(json) {
		var html = '';
		if(json.rows.length>0) {
			for(var i = 0; i < json.rows.length; i++) {
				var index = i+1;
				html += '<!-- 팝업 //-->';
				html += '<div class="option-popup-item">';
				html += '	<input type="radio" name="editPopup" id="editPopup' + index + '" class="popup_element_ckecked" title="' + adWrite.rawurldecode(json.rows[i].popup_title) + '" data-idxno="' + json.rows[i].idxno + '" data-step="' + json.rows[i].step + '" value="' + json.rows[i].popup_idxno + '" />';
				html += '	<label for="editPopup' + index + '">';
				if(json.rows[i].popup_image && json.rows[i].extension != 'swf') {
					html += '<img src="/bannerpop/uploads/image/' + json.rows[i].popup_image + '" alt="' + adWrite.rawurldecode(json.rows[i].popup_title) + '" />';
				}else{
					if(json.rows[i].extension == 'swf') html += 'SWF';
					else html += 'HTML';
				}
				html += '		<div class="option-popup-item-title">' + adWrite.rawurldecode(json.rows[i].popup_title) + '</div>';
				html += '	</label>';
				html += '</div>';
				html += '<!--// 팝업 -->';
			}
		}

		parent.$('.option-popup-group').html(html);
	}

	//전체선택ㆍ해제
	,allChk:function()
	{	
		var $allChk = $('#allCheck');
		$allChk.click(function(){
			if($(this).is(':checked') == true) {
				$('.elembox').prop('checked',true);
			}else{
				$('.elembox').prop('checked',false);
			}
		});
	}

	/**
	 * 클립보드 복사 
	 * source : 복사할 정보
	 */
	,copyExe:function(source)
	{
		if(window.clipboardData){			// ie
			window.clipboardData.setData('Text',source);
			alert("복사되었습니다. 원하는 곳에 붙여넣기하여 주세요.");
		}else{								// etc
			//var $tmpDiv=$('<div class="blind">'+source.replace(/</g,"&lt;").replace(/>/g,"&gt;")+'</div>').appendTo("body")
			// blind가 display:none 속성 때문에 제거
			var $tmpDiv=$('<div>'+source.replace(/</g,"&lt;").replace(/>/g,"&gt;")+'</div>').appendTo("body")
				,range=document.createRange()
				,selection=null;

			range.selectNodeContents($tmpDiv.get(0));
			selection=window.getSelection();
			selection.removeAllRanges();
			selection.addRange(range);
			
			if(document.execCommand("copy", false, null)) alert("복사되었습니다. 원하는 곳에 붙여넣기하여 주세요.");
			else window.prompt('키보드의 ctrl+C 또는 마우스 오른쪽의 복사하기를 이용해주세요.', source);

			$tmpDiv.remove();
		}
	}

	/**
	 * 기능성 배너 추가/순서변경/삭제/
	 */
	 ,evtClickActivityAdd:function() {
		//sessionStorage.removeItem("last_idx");
		var activity_idxno=window.parent.$('#all-banner-list').closest('div').attr('data-activity-idxno')||'';
		$('#activity-add-btn').click(function() {
			var $this=$(this);
				//,$viewHref=$('#activity-view-btn').attr('href')
				//,$last_idx=(activity_idxno)?activity_idxno:sessionStorage.getItem('last_idx');
			
			if($('.banner_element_ckecked').is(':checked') == false) {
				alert('배너를 선택해주세요.');
				//if(!$last_idx) $('#activity-view-btn').addClass('is-hidden');
				return false;
			}else{
				var $checked=$(".banner_element_ckecked:checked")
					,arr = new Array();
				if($checked.length>0) {
					$.each($checked, function(idx, v) {
						arr.push(v.value);
					});

					var data = {mode:activity_idxno?'modify':'input', activity_idxno:activity_idxno, banner_idxno:arr};
					data = JSON.stringify(data);
					//console.log(data);
					$.ajax({
						url:"/bannerpop/activity_act.php"
						,type:'post'
						,dataType:'json'
						,contentType:'application/x-www-form-urlencoded; charset=utf-8'
						,data:{post_data:data}
						,success:function(json, result) {
							if(result == 'success') {
								if(json.response == 'ok') {
									//alert('추가되었습니다.\n우측에 버튼을 클릭하시면 상세 화면으로 이동합니다.');
									/*if(!activity_idxno) {
										sessionStorage.setItem('last_idx', json.last_insert_id);
										$('#activity-view-btn').attr('href', $viewHref + '&activity_idxno='+json.last_insert_id);
									}
									$('#activity-view-btn').removeClass('is-hidden');*/
									window.parent.location.reload();
								}else{
									//alert(json.msg);
									return false;
								}
							}else return false;
						},
     error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
					});
				}
			}
		});

		$('#banner-activity-box').sortable({
			axis: '',
			update: function() {
				//console.log($(this));
			}
		});

		$('.trash').click(function() {
			if($('.banner-activity-list').length <= 1) {
				alert('마지막 배너는 삭제 할 수 없습니다.');
				return false;
			}

			var $this=$(this)
			,$parent = $this.closest('.banner-activity-list');

			$parent.fadeOut('fast', function(){
				$parent.remove();	
			});
		});

		$('#all-banner-list').on('click', function(e) {

			$this = $(this);
			href = $this.attr('href');

			$("#edit-modal-iframe").attr("src", href);
			$('#edit-modal').foundation('open');

			return false;
		});

		$('#edit-modal').on('open.zf.reveal', function(e){
			$('#for-loading').show();
		});

		$('#edit-modal').on('closed.zf.reveal', function(e){
			$("#edit-modal-iframe").attr("src", "about:blank").height('0px').closest('#activity-modal').css('height', '0px');
		});
	 }

	 ,valid_activity:function() {
		if($('#activity_title').val() == '') {
			alert('제목을 입력하세요.');
			$('#activity_title').focus();
			return false;
		}

		if($('.banner-activity-list').length<=0) {
			alert('배너를 하나 이상 추가하셔야 합니다.');
			return false;
		}

		return true;
	 }

}; // end adWrite 

var bannerpop={
	vars:{
		popup:{
			bodyWidth:0
			,bodyLeft:0
			,screenWidth:0
			,popname:"popup_"
			,width:{ window:[],layer:[] }
			,height:{ window:[],layer:[] }
			,top:{ window:[],layer:[] }
			,left:{ window:[],layer:[] }
			,order:0						// z-index용 순차적
			,view:"normal"					// 일반 : normal or 관리자 : manager
		}
		,isMobileMode:false
	}

	/**
	 * 배너 효과
	 * 태그 작성 예::: bannerpop.banner(".banner_event_box");
	 <div class="boder_box banner_event_box" data-type="slide" data-idxno="3" data-speed="0.3">		
		<div class="boder_box beb_box">
			<ul class="no_type beb_ul">
				<li class="beb_li" data-delay="1"><a href=""><img src="http://sample.ndsoftnews.com/template_sian/download.php?idxno=856&file_extension=jpg&filename=Untitled-1.jpg" alt="배너 : 제목" /></a></li>
				<li class="beb_li" data-delay="1"><a href=""><img src="http://sample.ndsoftnews.com/template_sian/download.php?idxno=854&file_extension=jpg&filename=250%B0%E6%B3%B2%B5%B5%B9%CE%BD%C5%B9%AE.jpg" alt="배너 : 제목" /></a></li>
				<li class="beb_li" data-delay="1"><a href=""><img src="http://sample.ndsoftnews.com/template_sian/download.php?idxno=846&file_extension=jpg&filename=330%C6%F7%C5%E4.jpg" alt="배너 : 제목" /></a></li>
				<li class="beb_li" data-delay="1"><a href=""><img src="http://sample.ndsoftnews.com/template_sian/download.php?idxno=848&file_extension=jpg&filename=675_weeklyjournal.jpg" alt="배너 : 제목" /></a></li>
				<li class="beb_li" data-delay="5"><iframe width="640" height="360" src="http://www.youtube.com/embed/dykTgBpgbVs?feature=player_detailpage" frameborder="0" allowfullscreen></iframe></li>
			</ul>
		</div>
		<div class="beb_buttons">
			<button type="button" class="beb_btns beb_btn_prev">뒤로</button>
			<button type="button" class="beb_btns beb_btn_stop">멈춤</button>
			<button type="button" class="beb_btns beb_btn_next">앞으로</button>
		</div>
	 </div>
	 */
	,effect:function()
	{
		var savePrefix = "banner_order_";

		// 배너 넓이 
		function setSizeInfo($this){
			var idxno = $this.attr("data-idxno")
				 ,$ul = $this.find(".beb_ul")
				 ,$li = $ul.find(".beb_li")
				 ,boxWidth = $this.innerWidth()||$this.closest("#float_side_box").width()	// 윙 사이드의 배너일경우 재측정
				 ,liCount = $li.length||0;
			
			// 관리자 페이지가 아닐때 실제 노출중인 것만 찾음
			//if(ADM_DOMAIN.indexOf(location.host)<0){
				$.each($li,function(){
					var $this=$(this), len=$this.find(".banner_box").length;
					if(!len) $this.remove();
				});
				$li = $ul.find(".beb_li");
				liCount = $li.length||0;
			//}

			// 부모박스 기준으로 ul 최대 넓이 지정
			$ul.width(boxWidth*liCount);

			// 배너마다 넓이가 다를수 있으니 부모박스 넓이기준으로함
			$li.width(boxWidth);

			return {
						idxno : idxno
						,$ul : $ul
						,$li : $li
						,boxWidth : boxWidth
						,liCount : liCount
					};
		}

		return {
			// 순서대로 하나의 배너만 보임 
			order:function(){
				var _this = this
					,$this = $(_this)
					,$info = setSizeInfo($this)
					,idxno = $info.idxno
					,$li =$info.$li
					,liCount = $info.liCount-1
					,saveKey = savePrefix+idxno
					,order = Number(localStorage.getItem(saveKey))||0;

				// 랜덤 선택된것만 보임, 버튼 없앰
				$li.css("display","list-item").not(":eq("+order+")").css("display","none");

				localStorage.setItem(saveKey, (order>=liCount ? 0 : order+1));
			}

			// random banner
			,random:function(){
				var _this = this
					,$this = $(_this)
					,$info = setSizeInfo($this)
					,$li =$info.$li
					,liCount = $info.liCount
					,random = Math.floor(Math.random()*liCount);

					// 랜덤 선택된것만 보임, 버튼 없앰
				$li.css("display","list-item").not(":eq("+random+")").css("display","none");
			}
			
			// random 배너 선택후 슬라이드
			,randomSlide:function(){
				bannerpop.effect()['slide'].call(this, true);
			}

			// slide banner
			// rand true or false
			,slide:function(rand){
				var _this = this
					,$this = $(_this)
					,$info = setSizeInfo($this)
					,$ul = $info.$ul
					,$li =$info.$li.css("display","list-item")
					,$btnBox = $this.find(".beb_buttons")
					,$btnStop = $btnBox.find(".beb_btn_stop")
					,$btnCurrent = null						// 현재 선택된 버튼 prev,next,play,stop of buttons
					,speed = Number(_this.getAttribute("data-speed"))||.3
					,delayInfo = $li.map(function(){ return Number(this.getAttribute("data-delay"))||5; }).get()
					,boxWidth =$info.boxWidth
					,liCount = $info.liCount
					,count = (rand===true?Math.floor(Math.random()*(liCount)):-1)	// 처음부터 +1 하고 시작하기에 -1초기값-random일때는 배너수중 1개
					,delay = null													// 멈춰잇는 시간(초)
					,left = boxWidth												// 움직이는 간격
					,si = null														// setInterval 변수 : animate complete에서 delay로 해결하려 했는데 뭔가 잘 안풀림
					,tmpDelay = null												// next, prev 시 delay 없이 넘김
					,firstBtnClicked = 0;											// prev,next로 이동하는가 - rotate에서 또한번 +,- 하기에 처음만 실행되어야 함

				/**** function //s ****/
				/*
					다음 배너
					@params
					 loop : 반복될것인가
					 mode : + or -
				*/
				function rotate(loop, mode){
					if(!mode) mode="+";
					if(mode==="+") count++;
					else  count--;

					if(count>=liCount || count<=0) count = 0;					// 지연시간 담은 배열찾기 key
					var front = count+1;													// 지연후 움직여야 하는 거리 미리 담아둠
					if(count>=(liCount-1)) front = 0;
					left = boxWidth*front*-1;
					delay = tmpDelay===null?delayInfo[count]:tmpDelay;

					si = setTimeout(function(){
						$ul.animate({ marginLeft:left }
										,speed*1000,
										function(){
											if(loop===false) $btnCurrent.prop("disabled", false);
											tmpDelay = null;
										});//.delay(delay*1000);	
						if(loop!==false) rotate();
					},delay*1000);								
				}

				// stop
				function stop(){
					firstBtnClicked++;

					//$ul.stop(true, false);
					clearTimeout(si);
					tmpDelay=null;
					$btnStop.addClass("beb_btn_start").text("play");
				}

				// restart
				function start(){
					firstBtnClicked = 0;

					count--;
					if(count<=0) count=0;

					tmpDelay=null;
					rotate();

					$btnStop.removeClass("beb_btn_start").text("멈춤");
				}
				
				// 이전
				function prev(){
					stop();

					if(firstBtnClicked===1) count--;			// 처음만 이미 증가된값을 감소시킴
					if(count<=0) count=liCount;

					tmpDelay=0;
					rotate(false,"-");

					$btnCurrent.prop("disabled", true);
				}

				// 이후
				function next(){
					stop();

					if(firstBtnClicked===1) count--;
					if(count>=liCount) count=0;

					tmpDelay=0;
					rotate(false);

					$btnCurrent.prop("disabled", true);
				}
				/**** function //e ****/

				// 처음 배너를 보이지 않는다는 것은 랜덤 배너의 슬라이드라는 것-처음보일배너 설정
				if(count>=0 && rand===true){
					var _boxWidth = boxWidth*(count>=liCount?liCount-1:count)*-1;
					count--;
					$ul.css("margin-left",_boxWidth+"px");
				}
				
				// 실행
				rotate();						
				
				// 버튼보임
				$btnBox/*.css("display","block")*/.find(".beb_btns").unbind("click")
				.click(function(){
					var $this = $(this);
	
					$btnCurrent = $this;
					if($this.is(".beb_btn_prev")) prev();
					else if($this.is(".beb_btn_next")) next();
					else if($this.is(".beb_btn_stop")){
						if($this.is(".beb_btn_start")) start();
						else stop();
					}
				});

				// mouseover event
				$ul.on(bannerpop.vars.isMobileMode?{touchstart:stop,touchend:start}:{mouseenter:stop,mouseleave:start});
			}
		};
	}

	// 배너호출
	,banner:function(target)
	{	
		var parents = this
			,$target = !!target.jquery?target:$(target);

		// mobile or pc mode?
		try{ bannerpop.vars.isMobileMode=document.querySelector("#user-wrap").className.indexOf("mobile")>=0||false }catch(e){ }
		
		//console.log($target);
		$.each($target, function(i, ele){
			var type = ele.getAttribute("data-type")||"random";
			parents.effect()[type].call(this);
		});
	}

	,getCookie:function(name)
	{	/*
		var cookie = document.cookie;
		if(cookie.indexOf(name)<0) return "";
		
		var regexp = new RegExp("^(.*)"+name+"=(.*?);(.*)$","g");
		return cookie.replace(regexp,"$2").replace(/^\s+|\s+$/g,"");
		*/
		name+="=";
	    var ca = document.cookie.split(';');
	    for(var i=0; i<ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0)==' ') c = c.substring(1);
	        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
	    }
	    return "";
	}
	
	,setCookie:function(name, value, days, domain)
	{
		var expires = "";
		if(days){
			var date = new Date();
			date.setTime(date.getTime()+(days*24*60*60*1000));
			expires = "; expires="+date.toGMTString();
		}
		
		/*
		var dm=SITE_DOMAIN.replace('http://','');
		dm=dm.replace('https://','');
		if(!domain) domain="." + dm;
		*/

		if(!domain) domain='.'+SITE_DOMAIN.replace(/^http(s)?:\/\//i,'').replace(/^(www|cms|slv|cdn|m)\./i,'');
		
		document.cookie = name+"="+value+expires+"; path=/; " + (domain?"domain="+domain+";":"");
	}

	// url을 array로
	,linkToJson:function(link)
	{
		if(!link) return false;
		
		var json = {}
			,tmp = link.replace(/^\/\?/,"").split("&");
		
		if(tmp.length<=0 || !tmp) return false;
		for(var i in tmp){
			var param = tmp[i].split("=")
				,key = param[0]
				,value = param[1];
			
			json[key] = value;
		}
		return json;
	}

	// 배너 append
	,append:function()
	{
		var id = ___BANNER
			,status = bannerStatus
			,time = ___currentTime
			,sTime = startTime
			,eTime = endTime
			,content = decodeURIComponent(bannerContent)
			,title = typeof bannerTitle == "undefined" ? "":decodeURIComponent(bannerTitle)
			,$target = $("#"+id)
			,voteUse = typeof bannerVoteUse == "undefined" ? "N":bannerVoteUse
			,explain = '';
			//,explain = "\n<br />"+util.timestampToDatetime(sTime).strDateTime.substring(0,16)+"~"+util.timestampToDatetime(eTime).strDateTime.substring(0,16);


		if(!id || $target.length<=0 || $target.attr("data-append")=="true") return false; // 객체가 없거나 시작전,이미 추가되었다면 중단
		
		// 예정,종료 배너
		else if(sTime > time || time > eTime || status=="0"){	
            var adminPageBool = (location.href.indexOf('/edit/adminSection.html') < 0)? false:true;
            if(!adminPageBool) {
                if(!($('body').hasClass('ndip_user_body_view') && voteUse == 'Y' && status == "0")) {
                    return false;    // 종료 메시지 안띄우기
                }
            }
            var voteAdcClass = "";
			var adcMsg=""
				,adcClass="";
			if(sTime > time && status!="0"){
				adcMsg = '노출예정 배너';
				adcClass = "banner-later";
			}else if(time > eTime || status=="0"){
				adcMsg = '종료된 배너';
				adcClass = "banner-finish";
				if(voteUse == "Y") voteAdcClass = "vote_banner_box_finish";
			}
			
			if(!adminPageBool) $target.attr("data-append","true").after('<div class="ad-finished '+voteAdcClass+'"></div>');    // 선거배너 종료 DIV
            else $target.attr("data-append","true").after('<div class="ad-finished"><span class="'+adcClass+'"><i class="icon-clock-o"></i>&nbsp;'+adcMsg+' "'+title+'"</span>'+explain+'</div>');	// 종료 메시지 띄우고 종료
			bannerTitle="";//초기화
			
			return false;
		}
		
		// cdn host 따라가게
		var _uri=$target[0].src
			,_host=((typeof URL === "function")?new URL(_uri).origin:_uri.match(/^(http.*)\/bannerpop\//)[1]||"");
		if(_host) content=content.replace('<img src="/bannerpop/', '<img src="'+(_host.search(/^http(s)?:\/\/cms\./)<0?_host:SITE_DOMAIN)+'/bannerpop/');
		
		$target.attr("data-append","true").after(content);	// 추가 되었으면 data-append 태그 나김
	}

	/****** 팝업 띄우기 
	var ___popup = [{},...];
	
	* json 내용 *
		idxno - 팝업 idxno 고유번호 
		title - 팝업의 제목 
		start - 팝업 시작일시
		end - 팝업 종료일시 
		status - 진행상태 (1=진행, 0=종료)
		popup_type - 팝업형태 (layer=레이어, window=윈도우)
		popup_size - auto (사용안함)
		popup_width - 팝업창크기(가로)
		popup_height - 팝업창크기(세로)
		position - auto (사용안함)
		x_position - 창의 x 위치 
		y_position - 창의 y 위치 
		apply_page - 적용페이지 (main, section, list, view 값이 입력 되어있음 , php에서 페이지 구분해서 json으로 만들어 줍니다.) 
		bottom_close - 하단표시 창닫기 출력여부 (Y=출력, N=출력안함)
		bottom_close_expire_ck - **동안 열지않기 (none=사용안함, day=하루동안 열지않기, days=몇일동안 열지않기)
		bottom_close_expire - 몇일인지
		layer_border - 레이어 팝업인 경우 외곽선 (Y=사용함, N=사용안함)
		layer_move - 레이어 팝업인 경우 드래그 가능 (Y=사용함, N=사용안함)
		layer_scroll - 레이어 팝업인 경우 스크롤 따라다니기 (Y=사용함, N=사용안함)
		layer_close - 레이어 팝업인 경우 닫기 아이콘 (Y=사용함, N=사용안함)
		layer_close_icon - 레이어 팝업인 경우 닫기 아이콘 유형 
		layer_close_position - 레이어 팝업인 경우 닫기 아이콘 출력 위치 (TL-상/좌, TR-상/우, BL-하/좌, BR-하/우)
		window_scroll - 윈도우 팝업인 경우 스크롤 활성화 (Y=사용함, N=사용안함)
		content - 출력 HTML 내용
	*****/
	,float:function(j)
	{
		// json 값
		var current = ___currentTime
			,start = Number(j.start)||0
			,end = Number(j.end)||(new Date().getTime()+100)	// 종료일이 기입되지 않았다면, 현재보다 100씩더해서 계속 늘림 
			,status = j.status||"0";
	
		if(this.vars.popup.view!="manager" && (status=="0" || current < start || (current > end && end!==0))) return false;												// 종료 or 기간이 아니라면 통과
			
		var	parents = this
			,idxno = j.idxno||"0"
			,oriTitle = j.title||""
			,title = decodeURIComponent(j.title)||""
			,popupType = j.popup_type||"window"
			,popupSize = j.popup_size||"auto"
			,popupWidth = Number(j.popup_width)||0
			,popupHeight = (Number(j.popup_height)||0) + 32
			,position = j.position||"auto"
			,xPosition = Number(j.x_position)||0
			,yPosition = Number(j.y_position)||0
			,applyPage = j.apply_page||"main"
			,bottomClose = j.bottom_close||"N"
			,bottomCloseExpireCk = j.bottom_close_expire_ck||"none"
			,bottomCloseExpire	= j.bottom_close_expire||1
			,layerBorder = j.layer_border||"N"
			,layerMove = j.layer_move||"N"
			,layerScroll = j.layer_scroll||"N"
			,layerClose = j.layer_close||"N"
			,layerCloseIcon = j.layer_close_icon||""
			,layerClosePosition = j.layer_close_position||"BR"
			,windowScroll = j.window_scroll||"Y"
			,content = decodeURIComponent(j.content)||""
			,popupUrl = j.popup_url||""// + (parents.vars.popup.view=="manager"?"?edit_mode=preview":"")||""
			,top = 0
			,left = 0
			,popname = parents.vars.popup.popname+idxno
			,_type = popupType; 								// default: 각자띄움 - 팝업과 레이어가 위치값을 공유하여 차례로 띄울려면 "window" or 공유하지 않고 각자 띄울려면 popupType;

		var type = {		
			calcPosition:function(){
				// x,y 가 0일때는 auto로 간주
				if((xPosition===0 && yPosition===0)/* || position=="auto"*/){
					var maxHeight = parents.arrayMaxMin(parents.vars.popup.height[_type],"max")
						,maxTop = parents.arrayMaxMin(parents.vars.popup.top[_type],"max")
						,initLeft = popupType=="window"?0:parents.vars.popup.bodyLeft
						,prevWidth = parents.vars.popup.width[_type][parents.vars.popup.width[_type].length-1]||0
						,prevLeft = parents.vars.popup.left[_type][parents.vars.popup.left[_type].length-1]||initLeft;			// 바로 이전 팝업 넓이를 left값으로 정함-window:0, layer:content의 left
		
					//console.log(popupWidth);
					left = prevLeft+prevWidth;
					
					// 페이지 넓이보다 자리잡은 left값이 크다면 화면상 한단계 내림
					if(left>parents.vars.popup[popupType=="window"?"screenWidth":"bodyWidth"]){
						top += maxHeight;						
						left = initLeft;
						
						// 다음 단계이니까 초기화 함
						parents.vars.popup.width[_type] = [];
						parents.vars.popup.height[_type] = [];
						parents.vars.popup.top[_type] = [];
						parents.vars.popup.left[_type] = [];
					}else{
						top = (maxTop||0);
					}
					
					// 변화된값 배열에 넣기 위해 조작
					xPosition = left;
					yPosition = top;
					
					// 변수에 담음
					parents.vars.popup.width[_type].push(popupWidth||0);
					parents.vars.popup.height[_type].push(popupHeight||0);
					parents.vars.popup.top[_type].push(yPosition||0);
					parents.vars.popup.left[_type].push(xPosition||0);
										
				}else{
					top = yPosition;
					left = xPosition;
				}
			}
		
			// 관리자 미리보기시 중앙에
			,setPositionCenter:function(){
				var _width = (document.body.clientWidth/2)-(popupWidth/2)
					,_scrollTop = document.body.scrollTop;
				
				top = _scrollTop + 50;
				left = _width;
			}
			
			// 띄울 페이지 applyPage
			,isApplyPage:function()
			{
				// 관리자 통과
				if(parents.vars.popup.view=="manager") return true;
				/*
				var params = bannerpop.linkToJson(location.search.replace("?",""))
					,mod = params.mod||""
					,act = params.act||""
					,section = params.section||"";
				
				// 메인
				if(((mod=="main" && act=="index" && !section) || (!mod && !act && !section)) && applyPage.indexOf("main")>=0) return true;
				// 섹션
				else if(mod=="main" && act=="index" && section && applyPage.indexOf("section")>=0) return true;
				// 기사 리스트
				else if(mod=="news" && act=="articleList" && applyPage.indexOf("list")>=0) return true;
				// 기사뷰
				else if(mod=="news" && act=="articleView" && applyPage.indexOf("view")>=0) return true;
				*/
			}
		
			,window:function(){
				//if(this.isApplyPage()!==true) return false;
				
				this.calcPosition(); // 위치 계산
				var winpopupUrl = '/bannerpop/popup.html?win_popup_idxno=' + idxno;
				window.open(winpopupUrl, popname, "width="+popupWidth+",height="+popupHeight+",scrollbars="+(windowScroll=="Y"?"yes":"no")+",resizable=yes,top="+top+",left="+left);
			}
		
			,layer:function(){
				//if(this.isApplyPage()!==true) return false;
				
				this.calcPosition(); // 위치 계산
			
				var $content = $(content);

				$content.attr({"id":popname})
				.css({"top":top+"px","left":left+"px","max-width":popupWidth+"px","min-height":popupHeight+"px","z-index":"100" + parents.vars.popup.order}).addClass("layer_box"+(layerScroll=="Y"?" layer_box_fixed":"")+(layerBorder=="Y"?" layer_box_border":""))
				.find(".popup_close_box").addClass("layer_close_box");
				
				// 드래그 가능
				if(layerMove=="Y") $content.addClass("layer_box_cursor_move").draggable();				
				
				// 창닫기-icon 닫기 버튼은 별개다
				//if(bottomClose=="Y"){	
				var $btnClose = $content.find(".popup_close, .popup_close_map, .popup_icon_close");
				$btnClose.each(function(){
					var _$this = $(this);
					//if(_$this.is(".popup_close") && bottomClose=="Y") _$this.text('창닫기');

					if(_$this.is(".popup_icon_close")) {
						if(layerClosePosition == 'BL' || layerClosePosition == 'BR') {
							
							if($content.find(".popup_close, .popup_close_map").length>0) {
								_$this.css('top',Number(j.popup_height)-40+'px');	
							}
						}

						_$this.addClass("layer_position_"+layerClosePosition);
					}
				});
				
				$btnClose.click(function(){
					parents.evtClose(popupType, idxno);	
					return false;
				});
				//}

				// 이미지내 링크가 창닫기 라면
				//$content.find("a[href*='javascript:window.close()']").click(function(){
				$content.find("[href*='javascript:window.close()']").click(function(){
					parents.evtClose(popupType, idxno);	
					return false;
				});

				// 하루, 몇일동안 열지 않기
				parents.daysNotOpen(bottomCloseExpireCk, bottomCloseExpire, $content.find(".popup-days, .popup_day_close_map"), j);
				
				// 관리자 미리보기시 중앙에
				if(parents.vars.popup.view=="manager"){
					$content.appendTo(document.body);
					this.setPositionCenter();	
					$content.removeClass("layer_box_fixed").css({"top":top+"px", "left":left+"px"});
				}else{
					$content.appendTo($("#layer-popups"));
				}
				
				// 이미지맵 리사이즈
				$('img[usemap]', $content).rwdImageMaps();
			}				
		};
	
		type[popupType]();		
	}
	
	// 팝업띄우기
	,popup:function()
	{
		//try{
			var parents = this;
			$(window).on("load", function(){
				if(!window.___popup) return ;
				if($.isArray(___popup)===false && ___popup.length>0) return ;
				if(!window.___currentTime) ___currentTime = Math.floor(new Date().getTime()/1000);// 시간이 설정되지 않았다면 js 시간으로 설정함
								
				var $content = $("#layer-popups");
				
				if($content.length<=0) return false;
				parents.vars.popup.bodyWidth = $content.innerWidth();			
				parents.vars.popup.bodyLeft = $content.position().left;
				parents.vars.popup.screenWidth = window.screen.width;
				for(var i=0,cnt=___popup.length; i<cnt; i++){
					// 쿠키인지 판단후 열기
					var coo = "";
					coo = bannerpop.getCookie(parents.vars.popup.popname+___popup[i].idxno)

					if(!coo){
						parents.vars.popup.order++;
						parents.float(___popup[i]);
					}
				}
			});
		//}catch(e){}		
	}	
	
	// 창닫기
	,evtClose:function(mode, idxno)
	{
		if(mode=="layer"){
			var layerId = bannerpop.vars.popup.popname+idxno;
			
			$("#"+layerId).fadeOut("fast", function(){
				$(this).remove();
			});
		}else window.close();
	}
	
	// cookie
	,evtCookieClose:function(name, days)
	{
		bannerpop.setCookie(name, "popup", days);
	}
	
	// 하루,몇일동안 열지 않기
	,daysNotOpen:function(expire, period, $btn, p)
	{
		var parents = this
			,idxno = p.idxno
			,isClickedMap = false;
		
		if(expire!="none"){
			$btn.each(function(i,v) {
				var $thisBtn = $(this);
				if($thisBtn.is(".popup-days")){
					// 하루동안
					if(expire=="day"){
						$thisBtn.click(function(){
							parents.evtCookieClose(parents.vars.popup.popname+idxno, "1");
							parents.evtClose(p.popup_type, p.idxno);
							return false;
						})
						// 닫기 태그 안에 암것두 없는 거 찾아 닫기 텍스트 넣어주기
						.not(":has(*)").html('<a href="#close-to-layer">하루동안 보지 않기</a>');
					}
					// 몇일동안 daySubfix
					else if(expire=="days"){
						var select = '<a href="#link">'
									+'<label class="show-for-sr" for="popDays"></label>'
									+'<select name="popDays" id="popDays" class="tiny" title="기간">'
									+'	<option value="1">하루</option>'
									+'	<option value="2">2일</option>'
									+'	<option value="3">3일</option>'
									+'	<option value="4">4일</option>'
									+'	<option value="5">5일</option>'
									+'	<option value="6">6일</option>'
									+'	<option value="7">7일</option>'
									+'</select> 동안 열지않기'
									+'</a>';
						var html = '<a href="#link">'
									+ (period>1 ? '몇일동안 보지 않기' : '하루동안 보지 않기')
									+'</a>';
						//$btn.not(":has(*)").append(select).click(function(){
						$thisBtn.append(html).click(function(){
							var $this = $(this)
								//,days = $this.prev("select").val();
								,days = period;
							
							parents.evtCookieClose(parents.vars.popup.popname+idxno, days);
							parents.evtClose(p.popup_type, p.idxno);
							return false;
						});					
					}
				}else{
					// 이미지맵일때, 하루동안 열지않기
					$thisBtn.click(function(){
						parents.evtCookieClose(parents.vars.popup.popname+idxno, "1");
						parents.evtClose(p.popup_type, p.idxno);	
						return false;
					});	
					
					isClickedMap = true;
				}
			});
		}
		
		// expire 값이랑 관계없이 이미지맵을 찾아 처리
		if(isClickedMap===false && $btn.is(".popup_day_close_map")){
			// 이미지맵일때, 하루동안 열지않기
			$btn.click(function(){
				parents.evtCookieClose(parents.vars.popup.popname+idxno, "1");
				parents.evtClose(p.popup_type, p.idxno);	
				return false;
			});	
		}
	}
	
	// window popup control
	,popupControl:function()
	{
		if(!___popup) return ;
		if((typeof ___popup)!=="object") return ;
		
		var parents = this
			,p = ___popup		
			,title = decodeURIComponent(p.title)||"" 
			,popupType = p.popup_type||"window"
			,bottomClose = p.bottom_close||"Y"
			,bottomCloseExpireCk = p.bottom_close_expire_ck||"day"	// : day,days,none
			,bottomCloseExpire = p.bottom_close_expire||1	// : 몇일
			,$btnClose = $(".popup_close, .popup_close_map, .popup_icon_close")
			,$btnDayClose = $(".popup-days, .popup_day_close_map");
		
		if(popupType!="window") return ;
		
		// 윈도우 바 타이틀 교체
		document.title = title;
	
		// 창닫기
		if(bottomClose=="Y"){
			$btnClose.each(function(){
				var _$this = $(this);
				//if(_$this.is(".popup_close")) _$this.text('창닫기');
			});
			
			$btnClose.click(function(){
				parents.evtClose(p.popup_type, p.idxno);	
				return false;
			});
		}
		
		// 하루, 몇일동안 열지 않기
		this.daysNotOpen(bottomCloseExpireCk, bottomCloseExpire, $btnDayClose, p);
		
	}

	// array 최고값
	,arrayMaxMin:function(arr, mode)
	{
		if($.isArray(arr)===false) return false;
	
		if(!mode) mode = "max";
		arr.sort(function(a, b){
			return b-a;
		});
		return (mode=="max"?arr[0]:arr[arr.length-1])||0;
	}

    // 통계 애널리틱스 이벤트 연결
    ,analytics:function(type, banner, agent) {
        if (!type||!banner||!agent) return;

        switch (type) {
            case "view":
                agent.forEach(function(agt) {
                    try{
                        if (agt=="ga" && typeof ga!="undefined") {
                            ga('send', 'event', '배너뷰', 'NDVIEWBANNER', banner);
                        }
                        if (agt=="gtag" && typeof gtag!="undefined") {
                            gtag('event', 'NDVIEWBANNER', {'event_category': '배너뷰', 'event_label': banner});
                        }
                        if (agt=="wcsnaver" && typeof wcs!="undefined") {
                            wcs.event(banner, 'NDVIEWBANNER');
                        }
                    } catch (e) {}
                });
                break;

            case "click":
                agent.forEach(function(agt) {
                    try {
                        if (agt=="ga" && typeof ga!="undefined") {
                            ga('send', 'event', '배너클릭', 'NDCLICKBANNER', banner);
                        }
                        if (agt=="gtag" && typeof gtag!="undefined") {
                            gtag('event', 'NDCLICKBANNER', {'event_category': '배너클릭', 'event_label': banner});
                        }
                        if (agt=="wcsnaver" && typeof wcs!="undefined") {
                            wcs.event(banner, 'NDCLICKBANNER');
                        }
                    } catch(e) {}
                });
                break;
        }

        // Tip!!
        // ga('send', 'event', 카테고리, 액션, 라벨)                    // 구글 유니버설 애널리틱스 태그 사용시 (analytics.js)
        // gtag('event', event_name, {event_category, event_label})    // 구글 글로벌 사이트 태그 사용시 (gtag.js)
        // wcs.event('이벤트카테고리명', '이벤트명')                     // 네이버 애널리틱스 사용시
    }
};

/******************************************************************************************************************
* 멀티 기능성 배너
*
* @update 2018/07/18
*/
var bannerpopMulti = {
    // php 전달 변수
    vars:{
        $banner_list:null,
        $edit_mode:""
    }
    
    // 페이지 초기 로드
    ,init:function() {
        $('input[name="effect_type"]').on("click", function() {
            if ($(this).val()=='none') {
                $("#row_num").val(0).attr("disabled", true);
                $("#scroll_num").val(0).attr("disabled", true);
            } else {
                $("#row_num").removeAttr("disabled");
                $("#scroll_num").removeAttr("disabled");
            }
        });

        $('input[name="autoplay"]').on("click", function() {
            if ($(this).val()=='Y') {
                $("#autoplay_speed").removeAttr("disabled");
            } else {
                $("#autoplay_speed").attr("disabled", true);
            }
        });

        $('#all-banner-list').on('click', function(e) {
            $this = $(this);
            href = $this.attr('href');
            $("#edit-modal-iframe").attr("src", href);
            $('#edit-modal').foundation('open');
            return false;
        });

        $('#banner-activity-box').sortable({
            axis: '',
            update: function() {
                console.log($(this));
            }
        });

        $('#edit-modal').on('open.zf.reveal', function(e){
            $('#for-loading').show();
        });

        $('#edit-modal').on('closed.zf.reveal', function(e){
            $("#edit-modal-iframe").attr("src", "about:blank").height('0px').closest('#activity-modal').css('height', '0px');
        });

        $(document).on("click", '.trash', function() {
            var $this=$(this)
            ,$parent = $this.closest('.banner-activity-list');
            $parent.fadeOut('fast', function(){
                $parent.remove();
            });
        });
    }

    // 배너 가져오기
    ,evtClickMultipleAdd:function() {
        var multi_idxno=window.parent.$('#all-banner-list').closest('div').attr('data-multi-idxno')||'';
        $('#activity-add-btn').on("click", function() { // #activity-add-btn 기능성배너 버튼 클릭 이벤트를 이용
            var $this=$(this);
            if($('.banner_element_ckecked').is(':checked') == false) {
                alert('배너를 선택해주세요.');
                return false;
            }else{
                var $checked=$(".banner_element_ckecked:checked")
                    ,arr = new Array();
                if($checked.length>0) {
                    $.each($checked, function(idx, v) {
                        arr.push(v.value);
                    });

                    var data = {mode:multi_idxno?'modify':'input', multi_idxno:multi_idxno, banner_idxno:arr};
                    data = JSON.stringify(data);
                    //console.log(data);

                    $.ajax({
                        url:"/bannerpop/activity_multi_act.php"
                        ,type:'post'
                        ,dataType:'json'
                        ,contentType:'application/x-www-form-urlencoded; charset=utf-8'
                        ,data:{post_data:data}
                        ,success:function(json, result) {
                            if(result == 'success') {
                                if(json.response == 'ok') {
                                    var item = JSON.parse(json.data),
										$target = window.parent.$("#banner-activity-box"),
                                        $sample = window.parent.$("#sample");
                                    bannerpopMulti.vars.$banner_list = item;
                                    bannerpopMulti.bannerCollocate($target, $sample);
                                    window.parent.$(".close-button").trigger("click");
                                }else{
                                    return false;
                                }
                            }else return false;
                        },
                        error:function(request,status,error){
                            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                        }
                    });
                }
            }
        });
    }

    // 배너 배치 하기
    ,bannerCollocate:function($targetArea, $sample) {
        if (!this.vars.$banner_list) return false;
        if (typeof $targetArea != "object" || typeof $sample != "object") return false;
        var item = this.vars.$banner_list;
        for (var i=0;i<item.length;i++) {
            var $areaBox = $targetArea,
                $clone = $sample.clone(),
                stateIcon = "";
            if (typeof $clone == "object") {
                if (item[i].state=="previous") stateIcon = '<span class="label success tiny">진행전</span>';
                else if (item[i].state=="proceeding") stateIcon = '<span class="label tiny">진행중</span>';
                else stateIcon = '<span class="label secondary tiny">진행종료</span>';
                $clone.attr("data-banner-idxno", item[i].idxno);
                $clone.find(".banner-activity-list").attr("data-banner-idxno", item[i].idxno).end().
                    find(".dis-table-cell").append(item[i].banner).end().
                    find('input[name="banner_idxno[]"]').val(item[i].idxno).end().
                    find(".dis-status").empty().append(stateIcon).end().
                    find('input[name="delay[]"]').attr("id", "delay_"+item[i].idxno).attr("value", item[i].delay).end().
                    find('.input-group-label').attr("for", "delay_"+item[i].idxno);
                $areaBox.append($clone.html());
            }
        }
    }

    // 선택된 배너 표시
    ,selectBannerCheck:function() {
        var $areaBox = window.parent.$("#banner-activity-box"),
            $list = $areaBox.find('input[name="banner_idxno[]"]'),
            $bannerItems = $(".adccfg_list_items"),
            bannerList = [],
            i = 0;
        $list.each(function() {
            bannerList.push($(this).val());
        });
        //console.log(bannerList);

        $bannerItems.each(function() {
            var $this = $(this),
                idxno = $this.attr("data-banner-idxno");
            if ($.inArray(idxno, bannerList)!=-1) {
                $this.find(".ad-tile").append('<div class="content-inert"><button type="button" class="content-buttons display has-tip" title="삽입된배너" data-tooltip><i class="icon-tv"><span class="show-for-sr">삽입된배너</span></i></button></div>');
            }
        });
    }
    
    // 배너 등록하기
    ,valid_multi:function(form) {
        if(form.title.value == '') {
            alert('제목을 입력하세요.');
            form.title.focus();
            return false;
        }

        if (form.column_num.value>9) {
            alert("열수는 1~9까지만 입력할 수 있습니다.");
            form.column_num.focus();
            return false;
        }

        if (form.row_num.value>9) {
            alert("행수는 1~9까지만 입력할 수 있습니다.");
            form.row_num.focus();
            return false;
        }

        if (form.scroll_num.value>9) {
            alert("스크롤수는 1~9까지만 입력할 수 있습니다.");
            form.scroll_num.focus();
            return false;
        }

        if($('.banner-activity-list').length-1<=0) {
            alert('배너를 하나 이상 추가하셔야 합니다.');
            return false;
        }

        return true;
    }

    // 멀티 기능성 배너 이벤트 로드
    ,bannerLoad:function() {
        $('.banner-multi-box').each(function() {
            var $effectType = $(this).attr("data-effect-type"),
                $rowNum = $(this).attr("data-row-num")||1,
                $colNum = $(this).attr("data-column-num")||1,
                $scrollNum = $(this).attr("data-scroll-num")||1,
                $moveDisplay = $(this).attr("data-move-display")||'none',
                $autoplay = $(this).attr("data-autoplay")||'N',
                $autoplaySpeed = $(this).attr("data-autoplay-speed")||5,
                $speed = $(this).attr("data-speed")||300,
                $random = $(this).attr("data-random")||'N',
                $bannerMultiBoxHtml = $(this);
                
                // 예약배너이거나 종료 배너일 경우 제외 처리.
                if(location.href.indexOf('/edit/adminSection.html')<0) {
                    $(this).find(".slick-slide").each(function(){
                        if($(this).find('.banner_box').length<=0) {
                            //$bannerMultiBoxHtml.find(".slick-slide").eq($(".slick-slide", $bannerMultiBoxHtml).index(this)).remove();
							$(this).remove();
                        }
                    });
                }

            if ($effectType!="none") {
                var totalSlide = $(this).find(".slick-slide").length||0,
                    randomStart = Math.floor(Math.random() * totalSlide);
                randomStart = ($random=="Y") ? randomStart : 0;

                var slickParam = {};
                slickParam.prevArrow = '<button type="button" class="roll-btns btn-prev"><i class="icon-angle-left-thin"><span class="show-for-sr">prev</span></i></button>';  // 이전버튼
                slickParam.nextArrow = '<button type="button" class="roll-btns btn-next"><i class="icon-angle-right-thin"><span class="show-for-sr">next</span></i></button>'; // 다음버튼
                slickParam.infinite = true;                                                                                                                     // 무한 넘기기
                slickParam.draggable = false;                                                                                                                   // 제스처(모바일용)

                switch ($effectType) {
                    case "vertical":
                        slickParam.slidesToShow = parseInt($rowNum,10);
                        slickParam.vertical = true;
                        slickParam.verticalSwiping = true;
                        if ($random=="Y"&&totalSlide>parseInt($rowNum,10)) slickParam.initialSlide = randomStart;
                        break;
                    case "horizon":
                    default:
                        slickParam.slidesToShow = parseInt($colNum,10);
                        if (parseInt($rowNum,10)>1) slickParam.rows = parseInt($rowNum,10);
                        if ($random=="Y") slickParam.initialSlide = randomStart;
                        break;
                }

                slickParam.slidesToScroll = parseInt($scrollNum,10);
                slickParam.arrows = ($moveDisplay=="arrow"&&bannerpopMulti.vars.$edit_mode!="delete")?true:false;
                slickParam.dots = ($moveDisplay=="dot"&&bannerpopMulti.vars.$edit_mode!="delete")?true:false;
                slickParam.dotsClass = "auto-pager";
                slickParam.autoplay = ($autoplay== "Y")?true:false;
                slickParam.autoplaySpeed = ($autoplay== "Y")?parseInt($autoplaySpeed,10)*1000:0;
                slickParam.speed = parseInt($speed, 10);
                slickParam.centerMode = false;
                slickParam.variableWidth = false;
                slickParam.focusOnSelect = true;
                //console.log(slickParam);

                $(this).slick(slickParam);
            } else {
                if ($random=="Y") shuffle($(this));
            }

            function shuffleArray(d) {
                for (var c = d.length - 1; c > 0; c--) {
                    var b = Math.floor(Math.random() * (c + 1));
                    var a = d[c];
                    d[c] = d[b];
                    d[b] = a;
                }
                return d;
            }

            function shuffle(target){
                var $box = $(target).children(".slick-slide-none")
                    ,$container = $box.children(".row")
                    ,$li = $box.find(".columns")
                    ,total = $li.length
                    ,tmp = [];

                for(var i=0;i<total;i++) tmp.push(i);

                $container.empty();
                setTimeout(
                    shuffleArray(tmp).forEach(function(a,b){
                        var $bannerBoxs=$li[a].querySelectorAll(".banner_box")
                            ,length=$bannerBoxs.length
                            ,div=document.createElement("div");
                        for(var i=0;i<length;i++){
                            div.appendChild($bannerBoxs[i]);
                            div.className = "columns";
                        }
                        $container.append(div);
                    })
                ,0);
            }
        });
    }
};

/* ****************************************** */
/* /script/resizePhoto.js					  */
/* ****************************************** */

function resizePhoto() {	

	var $_container = $('#article-view-content-div');
	var articleViewDivWidth = $_container.width();
	
	$_container.find('img').each(function(e){
		if($(this).closest('figure').length) {
			var ViewimageObj = new Image();
			var $_thisImgObj = $(this);
			ViewimageObj.src = $(this).attr("src");
			ViewimageObj.onload = function() {
				imageWidth = this.width;
				if(articleViewDivWidth <= imageWidth) {
					$_thisImgObj.closest('figure').addClass('bigsize');
				}
			};

		}
	});	

	$_container.on('click', 'figure.bigsize', function(e){
		$('<form action="/news/userArticlePhoto.html" method="POST"><input type="hidden" name="src" value="'+$(this).find("img").attr('src')+'"></form>').appendTo('body').submit();
	})
	.on('click', 'figure.bigsize figcaption', function(e){
		e.preventDefault();
		e.stopPropagation();
	});
}

/* ****************************************** */
/* /script/floating.banner.js                 */
/* ****************************************** */

$(window).scroll(function() {
	
	if(!($('#floating_banner_left').length || $('#floating_banner_right').length)) return false;
	
    var floatBannerLeft = $('#floating_banner_left'),
        floatBannerRight = $('#floating_banner_right'),
        
        HeadHeight = $('#user-header').height(),
        footerBoxTop = $('#user-footer').offset().top,
        footerBoxHeight = $('#user-footer').height(),

        scrollTop = $(window).scrollTop(),

        flBnLHeight = floatBannerLeft.height(),
        flBnRHeight = floatBannerRight.height(),

        ahtHeight = $('.aht-wrapper').height(),

        flBnLscrollLimit = footerBoxTop - flBnLHeight - HeadHeight - floatBannerLeft.data('down-margin'),
        flBnLscrollLimitChk = flBnLscrollLimit + footerBoxHeight + floatBannerLeft.data('down-margin'),
        flBnRscrollLimit = footerBoxTop - flBnRHeight - HeadHeight - floatBannerRight.data('down-margin'),
        flBnRscrollLimitChk = flBnRscrollLimit + footerBoxHeight + floatBannerRight.data('down-margin'),

        flBnLscrollTop = scrollTop - HeadHeight + ahtHeight + floatBannerLeft.data('top-margin'),
        flBnRscrollTop = scrollTop - HeadHeight + ahtHeight + floatBannerRight.data('top-margin');

    if(floatBannerLeft.data('scroll') == 'y'){
        if(floatBannerLeft.data('duration') > 0) floatBannerLeft.stop();
        if(scrollTop < HeadHeight) floatBannerLeft.animate({top: '0px'}, floatBannerLeft.data('duration'), 'linear');
        else if(scrollTop >= flBnLscrollLimitChk) floatBannerLeft.animate({top:flBnLscrollLimit + 'px'}, floatBannerLeft.data('duration'), 'linear');
        else if(scrollTop >= HeadHeight) floatBannerLeft.animate({top:flBnLscrollTop + 'px'}, floatBannerLeft.data('duration'), 'linear');
    }

    if(floatBannerRight.data('scroll') == 'y'){
        if(floatBannerRight.data('duration') > 0) floatBannerRight.stop();
        if(scrollTop < HeadHeight) floatBannerRight.animate({top: '0px'}, floatBannerRight.data('duration'), 'linear');
        else if(scrollTop >= flBnRscrollLimitChk) floatBannerRight.animate({top:flBnRscrollLimit + 'px'}, floatBannerRight.data('duration'), 'linear');
        else if(scrollTop >= HeadHeight) floatBannerRight.animate({top:flBnRscrollTop + 'px'}, floatBannerRight.data('duration'), 'linear');
    }
});

/* ****************************************** */
/* /script/mosaic.js					  	*/
/* ****************************************** */

function mosaic_autobox(data) {
	var $_container		= $(data[0].container);
	var autoplay		= data[0].autoplay;
	var autotime		= data[0].autotime;
	var temp_autoplay	= autoplay;
	var totalcount		= $_container.find('ul.auto-nav > li').length;
	var point			= 0;
	
	$_container.on('mouseenter', '.auto-cursor', function(e){
		mosaic_cmd('current', $(this).index());
	});

	$_container.on('mouseenter', function(e){
		if(autoplay) temp_autoplay = false;
	}).on('mouseleave', function(e){
		if(autoplay) temp_autoplay = true;
	});

	if(autoplay) {
		var rolling = window.setInterval(function () {
			if(temp_autoplay) mosaic_cmd('next', 0);
		}, autotime);
	}

	function mosaic_cmd(mode, current_point) {
		
		if(mode == "prev") {
			point -= 1;
			if(point < 0) point = totalcount - 1;
		}else if(mode == "next") {
			point += 1;
			if(point >= totalcount) point = 0;
		}else if(mode == "current") {
			point = current_point;
		}

		$_container.find('ul.auto-container > li').eq(point).show().siblings().hide();
		$_container.find('ul.auto-nav > li').eq(point).addClass('active').siblings().removeClass('active');

		if(point < 2){
			$_container.find('ul.auto-container').css({"left":"33.333333%","top":"33.333333%"});
		} else if(point < 4 && point >= 2) {
			$_container.find('ul.auto-container').css({"left":"0px","top":"33.333333%"});
		} else if(point < 6 && point >= 4) {
			$_container.find('ul.auto-container').css({"left":"0px","top":"0px"});
		} else if(point >= 6) {
			$_container.find('ul.auto-container').css({"left":"33.333333%","top":"0px"});
		}

		return false;
	}
}

/* ****************************************** */
/* /script/newsAutoCall.js					  */
/* ****************************************** */

function fn_articleAutoCall(mode, cycle) {

	var autoCallMode	= mode;
	var autoCallCycle	= 1000*60*cycle;
	var _autoCallWatch  = setInterval(action, autoCallCycle);

	// DESK중복수정이면 초기 1회 바로실행.
	if(autoCallMode == "desk") action();

	function action() {
		if(autoCallMode == "save") {
			if($('.auto-save', '#admin-aside').length > 0 && $('input:hidden[name="autoSave"]', '#newsWriteForm').val() != "") $('.auto-save', '#admin-aside').show();  
			TxRx("/news/articleAutoSave.ajax.php");
		}
		else if(autoCallMode == "desk")		TxRx("/news/articleAutoDesk.ajax.php");
		else								stop();
	}

	function TxRx(url) {

		$.ajax({
			type: "post",
			dataType: "json",
			url:url,
			data:$('#newsWriteForm').serialize(),
			success: function(data) {
				console.log(data[1]);
			},
			error: function(error, request) {
				console.log("자동콜에러 - code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				stop();
			}
		}).always(function() {
			if($('.auto-save', '#admin-aside').length > 0) $('.auto-save', '#admin-aside').fadeOut(1500);
		});
	}

	function stop() {
		clearInterval(_autoCallWatch);
		console.log(autoCallMode + '스톱');
	}
}

/* ****************************************** */
/* 기존	common.js							  */
/* ****************************************** */

/*---------------------------------------------------------------------------------------------
                                      JAVASCRIPT CODE
  ---------------------------------------------------------------------------------------------
	function name						| description				| use process
  ---------------------------------------------------------------------------------------------
	setCookie(쿠키명, 값, 유효기간(일))	| 							| 쿠키생성
	getCookie(쿠키명)					| 							| 쿠키가져오기
  ---------------------------------------------------------------------------------------------*/

// 쿠키 생성
function setCookie(cName, cValue, cDay, cDomain){
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    var cookies = cName + '=' + escape(cValue) + '; path=/; '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
    if(typeof cDay!='undefined')    cookies += 'expires=' + expire.toGMTString() + '; ';
    if(typeof cDomain!='undefined') cookies += "domain=" + cDomain + ';';
    else {
        var host=(typeof SITE_DOMAIN!='undefined')?SITE_DOMAIN:window.location.host
            ,domain='.'+host.replace(/^http(s)?:\/\//i,'').replace(/^(www|cms|slv|cdn|m)\./i,'');
        cookies += "domain=" + domain + ';';
    }
    document.cookie = cookies;
}

// 쿠키 가져오기
function getCookie(cName) {
	cName = cName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cName);
	var cValue = '';
	if(start != -1){
		start += cName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1)end = cookieData.length;
		cValue = cookieData.substring(start, end);
	}
	return unescape(cValue);
}

// 쿠키 지움
function delCookie(cName) {
    var today = new Date();
    today.setTime(today.getTime() - 1);
    var value = getCookie(cName);
    if(value != "") {
        var host=(typeof SITE_DOMAIN!='undefined')?SITE_DOMAIN:window.location.host
            ,domain='.'+host.replace(/^http(s)?:\/\//i,'').replace(/^(www|cms|slv|cdn|m)\./i,'')
            ,cookies = cName + "=" + value + "; path=/; expires=" + today.toGMTString() + '; ' + "domain=" + domain + ';';
        document.cookie = cookies;
    }
}


/*---------------------------------------------------------------------------------------------
                                      JAVASCRIPT CODE
  ---------------------------------------------------------------------------------------------
	function name						| description				| use process
  ---------------------------------------------------------------------------------------------
	checkMsgLength()					| 입력된 문자열 길이 검사			| 기사 댓글
	calculateMsgLength()				| 문자열 길이 반환				| 기사 댓글
	assertMsgLength()					| 문자열 길이만큼 잘라 변환		| 기사 댓글
  ---------------------------------------------------------------------------------------------*/

// 문자열길이 검사
function checkMsgLength(frm, id, lenStr) {
	var length = calculateMsgLength(document.getElementById(frm).value);
	document.getElementById(id).innerHTML = length;
	if (length > lenStr) {
		alert("최대 "+lenStr+" 바이트까지 남기실 수 있습니다.\r\n초과된 " + (length - lenStr) + "바이트는 자동으로 삭제됩니다.");
		document.getElementById(frm).value = assertMsgLength(document.getElementById(frm).value, lenStr, id);
	}
}

//문자열길이 반환
function calculateMsgLength(message) {
	var nbytes = 0;

	for (i=0; i<message.length; i++) {
		var ch = message.charAt(i);

		if (escape(ch).length > 4) {
			nbytes += 2;
		} else if (ch != "\r") {
			nbytes++;
		}
	}

	return nbytes;
}

//문자열 길이만큼 잘라 변환
function assertMsgLength(message, maximum, id) {
	var inc = 0;
	var nbytes = 0;
	var msg = "";
	var msglen = message.length;

	for (i=0; i<msglen; i++) {
		var ch = message.charAt(i);

		if (escape(ch).length > 4) {
			inc = 2;
		} else if (ch != "\r") {
			inc = 1;
		}

		if ((nbytes + inc) > maximum) {
			break;
		}

		nbytes += inc;
		msg += ch;
	}

	document.getElementById(id).innerHTML = nbytes;
	return msg;
}

/*---------------------------------------------------------------------------------------------
                                      JAVASCRIPT CODE
  ---------------------------------------------------------------------------------------------
	function name						| description				| use process
  ---------------------------------------------------------------------------------------------
	articleHeader()						| 기사뷰 헤더 네비			| 기사뷰 헤더 네비
  ---------------------------------------------------------------------------------------------*/

var articleHeader = {

	// 헤더 네비게이션 생성
	setScroll:function(){		
		jQuery(window).scroll(function() {
			if (jQuery(this).scrollTop() > 300) {
				jQuery('#sticky-header').addClass('scroll');
			} else {
				jQuery('#sticky-header').removeClass('scroll');
			}
		});			
	},
	

	// 기사이동
	move:function(mod, order_type, order_value, section_code, sub_section_code, serial_code){
		jQuery.post( "ajaxGetForwardIdxno.php", { mod: mod, order_type:order_type, order_value: order_value, section_code: section_code, sub_section_code: sub_section_code, serial_code: serial_code }, function( f_idxno ) {
			
			if(f_idxno){
				location.href = '/news/articleView.html?idxno='+f_idxno				
			}else{
				alert('기사가 존재하지 않습니다');
			}
			
		});
	}
	
}


/*---------------------------------------------------------------------------------------------
                                      JAVASCRIPT CODE
  ---------------------------------------------------------------------------------------------
	function name						| description				| use process
  ---------------------------------------------------------------------------------------------
  	bbsPrint(idxno)						| 게시물 인쇄창 오픈				| 게시물 인쇄창 오픈
	articlePrint(idxno)					| 인쇄창 오픈					| 인쇄창 오픈
	articleMail(idxno)					| 메일보내기창 오픈				| 메일보내기창 오픈
	articleErr(idxno)					| 오류신고창 오픈				| 오류신고창 오픈
	articleSingo(idxno)					| 댓글신고창 오픈				| 댓글신고창 오픈
	fn_guid()							| (랜덤)고유아이디 생성			| (랜덤)고유아이디 생성 
  ---------------------------------------------------------------------------------------------*/

//인쇄창 오픈
function bbsPrint( idxno, ps ) {
    var ps_str = "";
    if(ps != "") ps_str = "&ps="+ps;
    window.open('/bbs/bbsPrint.html?idxno='+idxno+ps_str, 'bbsPrint', 'width=660,height=500,scrollbars=yes');
}

// 인쇄창 오픈
function articlePrint( idxno ) {
	window.open('/news/articlePrint.html?idxno='+idxno, 'articlePrint', 'width=660,height=500,scrollbars=yes');
}

// 메일보내기창 오픈
function articleMail( idxno ) {
	window.open('/news/articleMail.html?idxno='+idxno, 'articleMail', 'width=660,height=500,scrollbars=yes');
}

// 오류신고창 오픈
function articleErr( idxno ) {
	window.open('/news/articleErr.html?idxno='+idxno, 'articleErr', 'width=660,height=500,scrollbars=yes');
}

// 댓글신고창 오픈
function articleSingo( idxno ) {
	window.open('/news/articleSingo.html?idxno='+idxno, 'articleSingo', 'width=660,height=500,scrollbars=yes');
}

//고유값생성 (기사등록 관련기사 띄울때 사용)
function fn_guid() {
    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
    }
    return s4() + s4() + s4() + s4() + s4() + s4() + s4() + s4();
}

/*****************************************************************************
*게시판 카테고리 설정
*****************************************************************************/
var bbsCfg={

	 // 카테고리 셋팅
     setCategory:function() {	

		 // 추가
        $('#admin-content').on('click', '#btn_category_add, .btn_category_delete, .btn_category_modify', function(e){

			var _this = this
			,$this = $(_this)
			,isAddButton = $this.is("#btn_category_add")
			,isDltButton = $this.is(".btn_category_delete")
			,isModalButton = $this.is(".btn_category_modify")
			,$categoryName = $('#category_name').val()
			,categoryArr = $categoryName.split(',');

			if(isAddButton){ // 추가
				categoryArr =categoryArr.filter(Boolean);
				for (var i in categoryArr) {
					var category = categoryArr[i];
	
					// 필수 항목 체크
					if(!category || category == "") {
						alert("카테고리명을 정확하게 입력해주세요.");
						return false;
					}

					// 중복체크
					if($('#category-div').find("input[class='category'][value='"+category+"']").length>0) {
						alert(category+' 카테고리는 존재합니다.');
						$('#category_name').val('');
						return false;
					}
					
					var _time = (Math.random()*new Date().getTime()).toFixed(0);
				    var html='';
					   html += "<li class='add-category-entity'> ";
					   html += "	<input type='hidden' name='category["+_time+"]' class='category' value='"+category+"'>";
					   html += "	<span class='button nd-pink small default-cursor btn_category_modify' data-cate-idxno='"+_time+"'><i class='icon-wrench'>&nbsp;</i>"+category+"</span><button type='button' class='button secondary small btn_category_delete' data-cate-idxno='"+_time+"' ><i class='icon-trash-o'></i></button>";
					   html += "</li>";
					$('#add-category').append(html); 
				}

				//초기화
				$('#category_name').val('');

			} else if(isModalButton) { // 수정 모달 

				var $this = $(this)
					,$form = $('#form_bbs_category')
					,$item = $this.closest(".add-category-entity")
					,$span = $this.closest(".btn_category_modify")
					,cate_idxno = $span.data("cate-idxno")
					,category = $item.find("input:hidden[name='category["+cate_idxno+"]']").val();

				$form.find('input:hidden[name="cate_idxno"]').val(cate_idxno);
				$form.find('input:text[name="category"]').val(category);

				$('#categoryAddModal').foundation('open');
				
				// 수정 
				$form.on('click', '.chk', function(e){
					if($item) { 
						var cate_idxno= $form.find('input:hidden[name="cate_idxno"]').val()
						   ,category = $form.find('input[name="category"]').val();

						if($form.find('[name="category"]').val() == ""){
							alert('카테고리 명을 정확하게 입력해주세요');
							$form.find('[name="category"]').focus();
							return false;
						}
							
						$item.find("input:hidden[name='category["+cate_idxno+"]']").val(category);
						$item.find("span[data-cate-idxno='"+cate_idxno+"']").html("<i class='icon-wrench'>&nbsp;</i>"+category).attr("data-category",category);
					}

					$('#categoryAddModal').foundation('close');
				});

			} else if(isDltButton) {  //삭제		
				var cate_idxno = $(this).closest(".btn_category_delete").data("cate-idxno");
				if(!window.confirm("삭제하시겠습니까?")) return false;
				$.post(	"/bbs/axBbsCategory.php"
						,{mode:"categoryChk",cate_idxno:cate_idxno}
						,function(data, rst){
							if(data.result === "success"){
								$this.closest(".add-category-entity").fadeOut("fast",function(){$(this).remove();});	
							}else alert(decodeURIComponent(data.msg));

				},"json");	
				return false;		
			}
		});
	 }

	 //정렬
	,evtSortableCategory:function(){
		var $box = $("#add-category"),
			table_name = $box.attr("data-table");
			
		$box.sortable({
			placeholder: "ui-state-highlight"
			,forcePlaceholderSize:true
			,update:function(event, ui){
			// 저장안함
			}
		});
	}

 	//카테고리 이동
 	,categoryMove:function(checkBoxIdxno){

        // 전체선택
		$("#all-dummy").click(function(e){
			$('input:checkbox[name="bbs_idxno[]"]', '#bbs_table').each(function(i){
				this.checked = $('input:checkbox[name="all_dummy"]', '#bbs_table').is(':checked');
			});
		});

		// 추가
		$('.bbs-skin').on('click', '.categoryModalBtn', function(e){
			var data=$(checkBoxIdxno).filter(function(i){ return this.checked?true:false; }).map(function(a,b){ return b.value; }).get();
			if(data.length<=0){
				alert("카테고리 이동 할 게시물을 선택해주세요.");
				return false;
			}
			//console.log(data);
			$('#categoryMoveModal').foundation('open');
			
			$('#categoryMoveForm').on('click', '.category_move_btn', function(e){
				var to_category = $('#categoryMoveForm').find('#toCategory option:selected').val(),
					table_name =  $('#categoryMoveForm').find('input:hidden[name="table_name"]').val();

				if(!window.confirm("카테고리 이동 할 게시물로 변경하시겠습니까?")) return false;
				$.post("/bbs/axBbsCategory.php"
						,{mode:"bbsCategoryMove","bbs_idxno[]":data,"to_category":to_category,"table_name":table_name}
						,function(data,rst){
							console.log(data);
							if(data.result!="success"){
								alert(data.msg||"문제가 생겼습니다. 잠시후 다시 시도 하여 주세요.");
								return false;
							}
							//alert("카테고리 이동이 완료되었습니다.");
							location.reload(true);
						},"json");

				return false;
			});
		});
    }
}

/*****************************************************************************
* 다중섹션설정
*****************************************************************************/
var multiSection ={

	// 섹션로드
	sectionLoad:function() {
		
		$('#admin-content').on('change', '.add-section-select', function(e){
			var tp = $(this).data('type');
			var code = $(this).val();
			var $_obj = $('#add_section');

			if(tp == 1) multiSection.changeSectionCode(tp, code);
			else if(tp == 2) {
				if($(this).val() == "") {
					multiSection.changeSectionCode(1, $_obj.val());
				}
				else multiSection.changeSectionCode(tp, code);
			}
		});

		//삭제
		$('#section-div').on('click', '.delete-button', function(e){
			var tp = $(this).data('type');
			$(this).closest('.'+tp+'-section-entity').remove();
		});
	}

	//섹션 코드 호출
	,changeSectionCode:function(tp,code) {

		var $_subsection = $('#add_subsection');
		var $_serial = $('#add_serial');
	
		$.ajax({
			type: "post",
			dataType: "json",
			url: "/news/changeSectionCode.ajax.php",
			data:{tp:tp, code:code},
			success: function(data) {
				if(data[0] == "Y"){
					if(tp == 1){
						$_subsection.html(data[1]);
						$_serial.html(data[2]);
					}else if(tp == 2){
						$_serial.html(data[2]);
					}
				}
			},
			error: function(error, request) {
				alert('error!!!');
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	
		return false;
	}

	// 자동박스 섹션추가&제외
	,addSectionCode:function() {

		// 섹션 단락 노출 여부 
		if($('.add-section-entity').length > 0) $('#section-div').show();
		else  $('#section-div').hide();

		$('#admin-content').on('click', '#sectionBtn', function(e){

			// 추가 or 제외
			var tp = $(this).data('type');

			//1차섹션
			var sectioncode = $('#add_section option:selected').val();
			var sectionname = $('#add_section option:selected').text();
			//2차섹션
			var subsectioncode = $('#add_subsection option:selected').val();
			var subsectionname = $('#add_subsection option:selected').text();
			//3차섹션
			var serialcode = $('#add_serial option:selected').val();
			var serialname = $('#add_serial option:selected').text();

			//1차섹션을 선택 안했을시...
			if(!sectioncode || sectioncode == "") {
				alert("추가할 섹션을 선택해주세요.");
				return false;
			}

			//  중복코드 체크
			var addSecCode = sectioncode;
			if(subsectioncode) addSecCode += '>'+subsectioncode;
			if(serialcode) addSecCode += '>'+serialcode;
			
			var duplicateChk = false;    

			// 동일한 섹션 구성이 추가&제외 동시 추가 제어
			$('.input_setion_data').each(function(){
				if( $(this).val() == addSecCode) {
					alert('이미 중복 된 코드가 존재합니다.');
					eixt;
					duplicateChk = true;
					return false;
				}
			});
			
			if(tp == 'add') {
				//전체가 선택 된 경우 단일 선택 제어
				$('.add_section_data').each(function(){
					if($(this).val() == "ALL"){
						alert('전체를 선택하실 경우 단일 섹션 선택은 하실 수 없습니다.');
						duplicateChk = true;
						return false;
					}
				});

				// 단일 섹션 선택시 전체 선택 제어
				if($('.add-section-entity').length > 0) {
					if(addSecCode == "ALL"){
						alert('단일 섹션이 이미 선택되어 있습니다. 전체는 선택하실 수 없습니다.');
						duplicateChk = true;
						return false;
					}
				}

			} else if(tp == "exc") { 

				if(addSecCode == "ALL"){
					alert('제외 섹션으로는 전체를 선택하실 수 없습니다.');
					duplicateChk = true;
					return false;
				} else {

					if($('.add-section-entity').length > 0) {
						$('.add_section_data').each(function(){
							if($(this).val().indexOf(addSecCode) != -1) { //포함할 경우 
								alert('추가 섹션에 포함 된 1차 섹션으로 제외할 수 없습니다. ');
								duplicateChk = true;
								return false;
							}
							if($(this).val() != "ALL"){
								if(addSecCode.indexOf(">") == -1) {
									alert('제외 섹션으로 처리할 수 없습니다.');
									duplicateChk = true;
									return false;
								}
							}
						});
					}
				}

				if($('.add-section-entity').length == 0) {
					alert('추가 섹션을 먼저 선택해주세요.');
					duplicateChk = true;
					return false;
				}
			}
			
			if(duplicateChk) return false;

			// 추가 될 경우 노출 
			$('#section-div').show();

			var title = "<span class='hollow button nd-pink default-cursor'>"+sectionname+"</span>";
			if(subsectioncode || subsectioncode != "") title += "<span class='hollow button warning default-cursor'>"+subsectionname+"</span>";
			if(serialcode || serialcode != "") title += "<span class='hollow button alert default-cursor'>"+serialname+"</span>";

			var html='';
			html += "<div class='button-group small "+tp+"-section-entity'>"; 
			html += "	<input type='hidden' name='"+tp+"_section_data[]' class='"+tp+"_section_data input_setion_data' value='"+addSecCode+"'>";
		//	html += "	<input type='hidden' class='"+tp+"-chk-sec' value='"+addSecCode+"'>";
			html += title;
			html += "	<button type='button' class='button nd-white tiny delete-button' data-type='"+tp+"' title='"+sectionname+" 삭제'><i class='icon-trash-o'></i><span class='show-for-sr'>삭제</span></button>";
			html += "</div>";
							
			$('#'+tp+'-section').append(html);  

			//.attr("data-code",category)
			
		});
	}

	//전송
	,multiSectionSumbit:function(form)
	{
	
	   if(!form.description.value)
	   {
		   alert("리스트명을 입력해주세요.");
		   description.focus();
		   return false;
	   }

	   if($('.add-section-entity').length == 0) {
			alert("연결 섹션을 선택해주세요.");
			return false;
	   }

		if(confirm("선택한 섹션을 하나의 리스트로 구성합니다. \n정말로 실행하시겠습니까?")) return true;
		else return false;

	}
	
}

/* ****************************************** */
/* /script/app.js	(파운데이션 실행파일			  */
/* ****************************************** */

$(function(){ 
	$(document).foundation();    
});

/*****************************************************************************
*기사 카운트 
*****************************************************************************/
var _statistics={
	articleCookieCount:function(article_idxno){
		if(!article_idxno) return false;
		
		var cookieRestore = false
			,articleIdxno = article_idxno
			,articleUniqView = _statistics.getCookie('___AUV')
			,dateTime = new Date();

		var regexp = new RegExp("_"+articleIdxno+"\.(\\d{10})x","i");
		var dataArr = articleUniqView.match(regexp); 

		if(dataArr !== null){
			var limitTime =  dateTime.setHours(dateTime.getHours() - 1);
			limitTime =  Math.floor(limitTime / 1000);
			if (limitTime > dataArr[1]){
				articleUniqView = articleUniqView.replace(dataArr[0], '');
				cookieRestore = true;
			}
		} else cookieRestore = true;

		if(cookieRestore === true) {  
			var newData = '_'+articleIdxno+'.'+ Math.floor(new Date().getTime() / 1000) +'x';
			$.ajax({
				url:'/news/makeArticleUniqSave.ajax.php',
				type:'POST',
				dataType:'json',
				cahse: false,
				data: {article_idxno:articleIdxno},
				success:function(rst,data){
					if(rst.result == "success"){
						var tmpTotalSize = 8 + articleUniqView.length + newData.length; 
						if (tmpTotalSize >= 2048) articleUniqView = articleUniqView.substr(0, (articleUniqView.length - newData.length));
						articleUniqView = newData + articleUniqView;

						var domain = '.'+ countDomain.replace(/^http(s)?:\/\//i,'').replace(/^(www|m)\./i,'');
						_statistics.setCookie("___AUV", articleUniqView.trim(), 30, domain);
					}
				},
				error: function(error, request) {
					console.log("error:"+error+"\n"+"request:"+request);
				}
			});
		}
	}
	,getCookie:function(name)
	{	
		name+="=";
		var ca = document.cookie.split(';');
		for(var i=0; i<ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') c = c.substring(1);
			if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
		}
		return "";
	}
	,setCookie:function(name, value, days, domain)
	{
		var expires = "";
		if(days){
			var date = new Date();
			date.setTime(date.getTime()+(days*24*60*60*1000));
			expires = "; expires="+date.toGMTString();
		}
		if(!domain) domain = countDomain.replace(/^http(s)?:\/\//i,'').replace(/^(www|m)\./i,'');
		document.cookie = name+"="+value+expires+"; path=/; " + (domain?"domain="+domain+";":"");
	}
}