export function getJSON(context, uri, params, onSuccess) {
    let XMLRequest = new XMLHttpRequest();
    let request = '';
    let first = 1;
    for (let key in params){
        if (params.hasOwnProperty(key)) {
            if (first === 1) {
                request = request + key + "=" + params[key];
                first = 0;
            } else
                request = request + "&" + key + "=" + params[key];
        }
    }
    XMLRequest.open('POST', uri);
    XMLRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    XMLRequest.onreadystatechange = () => {
        if (XMLRequest.readyState === 4) {
            onSuccess(XMLRequest.responseText);
        }
    };
    XMLRequest.send(request);
}

export function postFile(context, uri, params, onSuccess) {
    let XMLRequest = new XMLHttpRequest();
    let request = new FormData();
    for (let key in params){
        if (params.hasOwnProperty(key)) {
            request.append(key, params[key]);
        }
    }
    XMLRequest.open('POST', uri);
    XMLRequest.setRequestHeader("encType", "multipart/form-data");
    XMLRequest.onreadystatechange = () => {
        if (XMLRequest.readyState === 4) {
            onSuccess(XMLRequest.responseText);
        }
    };
    XMLRequest.send(request);
}