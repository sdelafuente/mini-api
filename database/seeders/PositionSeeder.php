<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PositionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // PositionSeeder.php
        DB::table('positions')->insert([
            [
                'name' => 'DBA Administrator',
                'description' => 'Minimum 5 years of experience in database administration, preferably with SQL Server, Oracle or MySQL. A degree in Systems Engineering, Computer Science, or a related field will be considered, although this is not exclusive. Familiar with SQL language.',
                'salary' => '70000',
                'location' => 'Cordoba, Argentina',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'name' => 'Network Engineer',
                'description' => 'We are seeking a highly skilled and experienced Network Engineer III to join our dynamic IT team. The ideal candidate will be responsible for supporting, implementing, and maintaining our network infrastructure, ensuring optimal performance, security, and reliability. This role requires strong problem-solving skills and the ability to work collaboratively with cross-functional teams. Network Maintenance: Monitor network performance, troubleshoot issues, and perform regular maintenance to ensure network reliability and security.',
                'salary' => '90000',
                'location' => 'Malaga, Spain',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'name' => 'Information Security Analyst',
                'description' => "Apple is seeking a security professional to join its newly established Information Security government engagement function. As cybersecurity policy has become an integral component of national and international politics, this individual will be responsible for engaging with internal business units and collaborating with partners to develop new mechanisms that enhance Apple’s resilience against threat actors and cybersecurity risks. ",
                'salary' => '255000',
                'location' => 'San Francisco, CA',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
        ]);
    }
}
