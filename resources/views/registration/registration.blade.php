@include('product.header')
<body>
    <div class="container">
        <div id="user_reg">
            <div class="container-product">
                <div class="container-form user">
                    <h2>Регистрация</h2>
                    <form action="{{route('user.create')}}" class="product-form" method="post" id="formId" enctype="multipart/form-data">
                        @csrf
                        <label for="name">Имя</label> 
                        <input type="text" name="name" required value="{{ old('name') }}" class="input">
                        @error('name')
                            <div style="color:red; text-align: left;">
                                {{ $message }}
                            </div>
                        @enderror
                        <label for="email">E-mail</label> 
                        <input type="text" name="email" required value="{{ old('email') }}" class="input">
                        @error('email')
                            <div style="color:red; text-align: left;">
                                {{ $message }}
                            </div>
                        @enderror
                        <label for="password">Пароль</label>
                        <input type="text" name="password" required value="{{ old('password') }}" class="input">
                        @error('password')
                            <div style="color:red; text-align: left;">
                                {{ $message }}
                            </div>
                        @enderror
                        <div class="form-check">
                            <input type="hidden" name="remember" id="rememberMy_hidden" value="0">
                            <input class="form-check-input" name="remember" type="checkbox" value="1">
                            <label class="form-check-label" for="remember">
                                Запомнить меня
                            </label>
                        </div>
                        <input type="submit" value="Отправить" class="product-btn" style="border: none" id="store_new_prod">
                    </form> 
                </div>
                <div class="close-btn">
                    <a href="{{route('products.index')}}">
                        <img src="/images/Close_round.svg" alt="close_button" width="30px">
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
