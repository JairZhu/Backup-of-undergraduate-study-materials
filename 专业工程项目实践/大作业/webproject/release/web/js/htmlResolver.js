export function getHTML(context, uri, params, onSuccess) {
    let XMLRequest = new XMLHttpRequest();
    let request = uri;
    let first = 1;
    for (let key in params){
        if (params.hasOwnProperty(key)) {
            if (first === 1) {
                request = request + "?" + key + "=" + params[key];
                first = 0;
            } else
                request = request + "&" + key + "=" + params[key];
        }
    }
    XMLRequest.open('GET', request);
    XMLRequest.onreadystatechange = () => {
        if (XMLRequest.readyState === 4 && XMLRequest.status === 200) {
            onSuccess(XMLRequest.responseText);
        }
    };
    XMLRequest.send();
}