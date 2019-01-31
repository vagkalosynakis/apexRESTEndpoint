@RestResource(urlMapping='/showObjects/*')
global class [object]
{    
    @HttpGet
    global static LIST<[object]> getObject()
    {
        List<[object]> lst;
        try{
            RestRequest req = RestContext.request;
            RestResponse res = RestContext.response;
			//return 1 object
            if(req.requestURI.substring(req.requestURI.lastIndexof('/')+1) !=''){
                String objectId = req.requestURI.substring(req.requestURI.lastIndexof('/')+1);
                lst = [select [field] from [object] where [field] = :[value]];
                return lst;
			//return all objects
            }else{
                lst = [select [field] from [object]];
                return lst;
            }
        }catch(Exception ex){
            system.debug('error: '+ex.getMessage());
        }
        return lst;
    }
    
    @HttpPost
    global static String postObject([param]){
        [Object] obj = new [Object]();
        obj.[field] = [value];
        insert obj;
        return obj.[field];
    }
}