CREATE TABLE "country" (
  "country_id" serial PRIMARY KEY,
  "country" varchar
);

CREATE TABLE "state" (
  "state_id" serial PRIMARY KEY,
  "state" varchar,
  "country_id" int,
  FOREIGN KEY ("country_id") REFERENCES "country" ("country_id")
);

CREATE TABLE "postcode" (
  "postcode_id" serial PRIMARY KEY,
  "postcode" varchar
);

CREATE TABLE "state_postcode_map" (
  "state_id" int,
  "postcode_id" int,
  FOREIGN KEY ("state_id") REFERENCES "state" ("state_id"),
  FOREIGN KEY ("postcode_id") REFERENCES "postcode" ("postcode_id")
);

CREATE TABLE "enforcement_district" (
  "local_authority_district_id" serial PRIMARY KEY,
  "local_authority_district" varchar
);

CREATE TABLE "enforcement_highway" (
  "local_authority_highway_id" serial PRIMARY KEY,
  "local_authority_highway" varchar
);

CREATE TABLE "enforcementMap" (
  "local_authority_district_id" int,
  "local_authority_highway_id" int,
    FOREIGN KEY ("local_authority_district_id") REFERENCES "enforcement_district" ("local_authority_district_id"),
  FOREIGN KEY ("local_authority_highway_id") REFERENCES "enforcement_highway" ("local_authority_highway_id")
);

CREATE TABLE "first_road" (
  "first_road_class" varchar,
  "first_road_number" varchar,
  "first_road_id" varchar GENERATED ALWAYS AS ("first_road_class" || '-' || "first_road_number") STORED,
  PRIMARY KEY ("first_road_id"),
  CONSTRAINT "first_road_unique_id" UNIQUE ("first_road_id")
);

CREATE TABLE "second_road" (
  "second_road_class" varchar,
  "second_road_number" varchar,
  "second_road_id" varchar GENERATED ALWAYS AS ("second_road_class" || '-' || "second_road_number") STORED,
  PRIMARY KEY ("second_road_id"),
  CONSTRAINT "second_road_unique_id" UNIQUE ("second_road_id")
);

CREATE TABLE "road_map" (
  "first_road_id" varchar,
  "second_road_id" varchar,
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id"),
  FOREIGN KEY ("second_road_id") REFERENCES "second_road" ("second_road_id")
);

CREATE TABLE "road_type" (
  "road_type_id" serial PRIMARY KEY,
  "road_type" varchar
);

CREATE TABLE "speed_limit" (
  "speed_limit_id" serial PRIMARY KEY,
  "speed_limit" int
);

CREATE TABLE "pedestrain_crossing_hc" (
  "pedestrian_crossing_human_control_id" serial PRIMARY KEY,
  "pedestrian_crossing_human_control" varchar
);

CREATE TABLE "pedestrain_crossing_pf" (
  "pedestrian_crossing_physical_facilities_id" serial PRIMARY KEY,
  "pedestrian_crossing_physical_facilities" varchar
);

CREATE TABLE "light_conditions" (
  "light_conditions_id" serial PRIMARY KEY,
  "light_conditions" varchar
);

CREATE TABLE "weather_conditions" (
  "weather_conditions_id" serial PRIMARY KEY,
  "weather_conditions" varchar
);

CREATE TABLE "road_surface_conditions" (
  "road_surface_conditions_id" serial PRIMARY KEY,
  "road_surface_conditions" varchar
);

CREATE TABLE "special_conditions_at_site" (
  "special_conditions_at_site_id" serial PRIMARY KEY,
  "special_conditions_at_site" varchar
);

CREATE TABLE "carriage_hazards" (
  "carriage_hazards_id" serial PRIMARY KEY,
  "carriage_hazards" varchar
);

CREATE TABLE "urban_rural_area" (
  "urban_rural_area_id" serial PRIMARY KEY,
  "urban_rural_area" varchar
);

CREATE TABLE "accidents" (
  "accident_id" int PRIMARY KEY,
  "number_of_vehicles" int,
  "number_of_casualties" int,
  "date" date,
  "time" time,
  "day_of_week" varchar,
  "police_present_at_scene" varchar,
  "police_force" int,
  "postcode_id" int,
  "pedestrian_crossing_human_control_id" int,
  "pedestrian_crossing_physical_facilities_id" int,
  "light_conditions_id" int,
  "weather_conditions_id" int,
  "road_surface_conditions_id" int,
  "special_conditions_at_site_id" int,
  "carriageway_hazards_id" int,
  "urban_rural_area_id" int,
  "first_road_id" varchar,
  "local_authority_highway_id" int,
  "speed_limit_id" int,
  "road_type_id" int,
  FOREIGN KEY ("pedestrian_crossing_human_control_id") REFERENCES "pedestrain_crossing_hc" ("pedestrian_crossing_human_control_id"),
  FOREIGN KEY ("pedestrian_crossing_physical_facilities_id") REFERENCES "pedestrain_crossing_pf" ("pedestrian_crossing_physical_facilities_id"),
  FOREIGN KEY ("light_conditions_id") REFERENCES "light_conditions" ("light_conditions_id"),
  FOREIGN KEY ("weather_conditions_id") REFERENCES "weather_conditions" ("weather_conditions_id"),
  FOREIGN KEY ("road_surface_conditions_id") REFERENCES "road_surface_conditions" ("road_surface_conditions_id"),
  FOREIGN KEY ("special_conditions_at_site_id") REFERENCES "special_conditions_at_site" ("special_conditions_at_site_id"),
  FOREIGN KEY ("carriageway_hazards_id") REFERENCES "carriage_hazards" ("carriage_hazards_id"),
  FOREIGN KEY ("urban_rural_area_id") REFERENCES "urban_rural_area" ("urban_rural_area_id"),
  FOREIGN KEY ("postcode_id") REFERENCES "postcode" ("postcode_id"),
  FOREIGN KEY ("local_authority_highway_id") REFERENCES "enforcement_highway" ("local_authority_highway_id"),
  FOREIGN KEY ("speed_limit_id") REFERENCES "speed_limit" ("speed_limit_id"),
  FOREIGN KEY ("road_type_id") REFERENCES "road_type" ("road_type_id"),
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id")
);
