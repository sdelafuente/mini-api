<?php

namespace Tests\Feature;

use App\Models\Position;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Testing\Fluent\AssertableJson;
use Tests\TestCase;

class PositionsTest extends TestCase
{
    use RefreshDatabase;

    /**
     * A basic feature test example.
     */
    public function test_endpoint_is_ok(): void
    {
        Position::create([
            'name' => fake()->name(),
            'description' => fake()->text(),
            'salary' => fake()->numberBetween(100, 100000),
            'location' => fake()->country()
        ]);

        $response = $this->get('/api/positions');

        $response->assertStatus(200);
    }

    public function test_endpoint_has_search_no_value(): void
    {
        $response = $this->get(route('positions', ["search" => "LASHDLHIASIHAOIHASD"]));

        $response->assertStatus(200);
        $response->assertJson(fn (AssertableJson $json) =>
            $json->has('positions', 0)
        );
    }

    public function test_endpoint_has_search_some_value(): void
    {
        $response = $this->get(route('positions', ["search" => "dba"]));

        $response->assertStatus(200);
        $response->assertJson(fn (AssertableJson $json) =>
            $json->has('positions', 1)
        );
    }
}
