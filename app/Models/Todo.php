<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Todo extends Model
{
    use HasFactory;

    protected $fillable = [
        'todo',
        'completed_at'
    ];

    public static function rules()
    {
        return [
            'todo' => 'required|string|min:3|max:255',
            'completed_at' => 'nullable|date'
        ];
    }
}
