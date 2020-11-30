({    
    // 初始化加载
    Init : function(component,event){
        // 调用后台类
        var action = component.get("c.GetAll");
        // 设置回调函数
        action.setCallback(this,function(response){
            // 返回状态
            var state = response.getState();
            if(state == 'SUCCESS'){
                var movieList = response.getReturnValue();
                if(movieList == 0){
                    component.set("v.message",true);
                }else{
                    component.set("v.message",false);
                }
                //参数传递
                component.set("v.results",movieList);
                component.set("v.count",movieList.length);
            }
        });
        // 队列处理
        $A.enqueueAction(action);
    }
})