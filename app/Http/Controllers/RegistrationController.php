<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RegistrationController extends Controller
{
    /**
     * showRegisterPage
     *
     * @return void
     */
    public function showRegisterPage()
    {
        return view("registration.registration", ['title' => 'Регистрация']);
    }
    
    /**
     * create user
     *
     * @param  mixed $request
     * @return void
     */
    public function create(Request $request)
    {
        $validated = validator($request->all(), [
            'name' => ['required', 'string', 'max:30'],
            'email' => ['required', 'string', 'email', 'max:100', 'unique:users'],
            'password' => ['required', 'string', 'max:255', 'min:6', 'unique:users'],
        ])->validate();

        $roles[] = 'ROLE_USER';

        $user = new User;

        $user->name = $validated['name'];
        $user->email = $validated['email'];
        if ($request->get('remember') == "1") {
            $remember = true;
            $user->remember_token = $request->get('_token');
        } else {
            $remember = false;
        }

        $user->roles = json_encode($roles);
        $user->password = bcrypt($validated['password']);

        $user->save();

        if (Auth::attempt($validated, $remember)) {
            $request->session()->regenerate();
        }
        return redirect()->intended('/products');
    }
}
