let product_change = document.getElementsByClassName('product_change');
let container = document.getElementsByClassName('container')[0];
for (var i = 0 ; i < product_change.length; i++) {
    product_change[i].addEventListener('click', function(event) {
        let show_prod = document.createElement('div');
        show_prod.className = "window_prod";
        const request = new XMLHttpRequest();
        request.open('GET', 'products/show/'+event.target.parentNode.getAttribute('id'), true);
        request.send();

        let promise = new Promise(function(resolve) {
            request.addEventListener('load', function() {
                if (request.status == 200) {
                    resolve(request.response);
                }
            });
        });
        promise.then(function(response) {
            show_prod.innerHTML =response;
            let edit_btn = document.getElementsByClassName('edit_btn')[0];
            let delete_btn = document.getElementsByClassName('delete_btn')[0];
            
            edit_btn.addEventListener('click', function() {
                let edit_prod = document.createElement('div');
                edit_prod.className = "window_prod";
                const request = new XMLHttpRequest();
                request.open('GET', 'products/edit/'+edit_btn.id, true);
                request.send();
                
                let promise = new Promise(function(resolve) {
                    request.addEventListener('load', function() {
                        if (request.status == 200) {
                            resolve(request.response);
                        }
                    });
                });
                promise.then(function(response) {
                    edit_prod.innerHTML = response;
                    let vendor_cont = document.getElementById('vendor-cont');
                    let vendor_body = document.getElementById('vendor-body');
                    let count = 0;
                    vendor_body.addEventListener('click' , function(event) {
                        if (event.target.getAttribute('id') === 'vendor') {
                            let div = document.createElement('div');
                            count++;
                            div.className = "vendor-group";
                            div.id  += `vend_${count}`;
                            div.innerHTML = `
                            <div class="vendor-group-item">
                            <label for="vendor-color_${count}">Название</label> 
                                <input type="text" name="vendor-name_${count}" value="">  
                            </div>
                            <div class="vendor-group-item pd">
                                <label for ="vendor-size_${count}">Значение</label> 
                                <input type="text" name="vendor-value_${count}" value="">
                            </div>
                            <div class="btn-delete">
                                <img src="/images/delete-btn.svg" alt="delete_button" id ="delete-btn_${count}" class="delete-btn" width="20px">
                            </div>`;
                            vendor_cont.append(div);
                        }         
                        if (event.target.getAttribute('alt') === 'delete_button') {
                            event.target.parentNode.parentNode.remove();
                        } 
                    });
                    store_new_prod.addEventListener('click' , function(event) {
                        event.preventDefault();
                        let article = document.querySelector('input[name="article"]').value;
                        let name = document.querySelector('input[name="name"]').value;
                        let status = document.getElementById('status').value;
                        let arr_input = [];
                        let arr = [];
                        let obj = {};
                        if (document.getElementsByClassName('vendor-group')) {
                            for (let i = 0; i < vendor_cont.children.length; i++) {
                                let element = vendor_cont.children[i];    
                                let item_input = element.querySelectorAll('input[type="text"]');
                                for (let elements of item_input) {
                                    arr_input.push(elements.value);
                                } 
                            }
                        }
            
                        let newArray = [];
                        for (let i = 0; i < arr_input.length; i += 2) {
                            newArray.push(arr_input.slice(i, i + 2));
                        }
                        for (let s = 0; s < newArray.length; s++) {
                            let elem = newArray[s];
                            obj = {
                                'name' : elem[0],
                                'value' : elem[1],
                            }
                            
                            arr.push(obj);
                        }
                        let data = {
                            'id': edit_btn.id,
                            'article': article,
                            'name' : name,
                            'status': status,
                            'vendor_array': arr,
                        };   
                        
                        let csrf_token = document.querySelector('meta[name="csrf-token"]').content;
                        let request_1 = new XMLHttpRequest();
                        request_1.open('post', 'products/update', true);
                        request_1.setRequestHeader("Content-type","application/json");
                        request_1.setRequestHeader("X-CSRF-TOKEN", `${csrf_token}`);
                        request_1.send(JSON.stringify(data));
                        let promise_1 = new Promise(function(resolve) {
                            request_1.addEventListener('load', function() {
                                if (request_1.status == 200) {
                                    resolve(request_1.response);
                                }
                            });
                        });
                        promise_1.then(function(response_1) {
                            if (response_1 == 'success') {
                                let message = document.createElement('div');
                                message.className = "message_wind";
                                message.innerHTML = `<h5>Продукт успешно отредактирован!</h5>`;
                                edit_prod.append(message);
                                setTimeout(function() {
                                    message.remove();
                                }, 2000);
                                setTimeout(function () {
                                    location.reload();  
                                }, 2500);
                                return false;
                            } else {
                                let error_name =  document.getElementById('error_name');
                                let error_article =  document.getElementById('error_article');
                                let errors = JSON.parse(response_1);
                                if (errors.name) {
                                    error_name.innerHTML = errors.name;
                                }
                                if (errors.article) {
                                    error_article.innerHTML = errors.article;
                                }
                            }
                        });
                    });
                });
                container.append(edit_prod);
                show_prod.remove();
            });

            delete_btn.addEventListener('click', function() {
                const request = new XMLHttpRequest();
                request.open('GET', 'products/destroy/'+delete_btn.id, true);
                request.send();
        
                let promise = new Promise(function(resolve) {
                    request.addEventListener('load', function() {
                        if (request.status == 200) {
                            resolve(request.response);
                        }
                    });
                });
                promise.then(function(response) {
                    let message = document.createElement('div');
                        message.className = "message_delete";
                    if (response == 'success') {
                        message.innerHTML = `<h5>Продукт успешно удалён!</h5>`; 
                    } else {
                        message.innerHTML = `<h5>Произошла ошибка!</h5>`;
                    }
                    delete_btn.append(message);
                    setTimeout(function() {
                        message.remove();
                    }, 2000);
                    setTimeout(function () {
                        location.reload();  
                    }, 2500);
                    container.append(message);
                });
            });
        });
        container.append(show_prod);
    });
}
