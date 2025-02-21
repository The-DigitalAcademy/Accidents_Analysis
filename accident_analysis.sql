CREATE TABLE "postcode" (
  "postcode_id" serial PRIMARY KEY,
  "postcode" varchar
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
  FOREIGN KEY ("postcode_id") REFERENCES "postcode" ("postcode_id")
);

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

CREATE TABLE "second_road" (
  "second_road_id" serial PRIMARY KEY,
  "second_road_class" varchar,
  "second_road_number" varchar
);

CREATE TABLE "road_type" (
  "road_type_id" serial PRIMARY KEY,
  "road_type" varchar
);

CREATE TABLE "speed_limit" (
  "speed_limit_id" serial PRIMARY KEY,
  "speed_limit" int
);



CREATE TABLE "first_road" (
  "first_road_id" serial PRIMARY KEY,
  "first_road_class" varchar,
  "first_road_number" varchar,
  "local_authority_highway_id" int,
  "second_road_id" int,
  FOREIGN KEY ("second_road_id") REFERENCES "second_road" ("second_road_id")
);

CREATE TABLE "road_accident_map" (
  "first_road_id" int,
  "accident_id" int,
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id"),
  FOREIGN KEY ("accident_id") REFERENCES "accidents" ("accident_id")
);

CREATE TABLE "speed_map" (
  "speed_limit_id" int,
  "first_road_id" int,
  FOREIGN KEY ("speed_limit_id") REFERENCES "speed_limit" ("speed_limit_id"),
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id")
);

CREATE TABLE "road_type_map" (
  "road_type_id" int,
  "first_road_id" int,
  FOREIGN KEY ("road_type_id") REFERENCES "road_type" ("road_type_id"),
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id")
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

CREATE TABLE "carriage_hazard" (
  "carriage_hazard_id" serial PRIMARY KEY,
  "carriage_hazard" varchar
);

CREATE TABLE "urban_rural_area" (
  "urban_rural_area_id" serial PRIMARY KEY,
  "urban_rural_area" varchar
);

CREATE TABLE "pedestrian_crossing_hc_map" (
  "pedestrian_crossing_human_control_id" int,
  "accident_id" int,
  FOREIGN KEY ("pedestrian_crossing_human_control_id") REFERENCES "pedestrain_crossing_hc" ("pedestrian_crossing_human_control_id"),
  FOREIGN KEY ("accident_id") REFERENCES "accidents" ("accident_id")
);

CREATE TABLE "pedestrian_crossing_pf_map" (
  "pedestrian_crossing_physical_facilities_id" int,
  "accident_id" int,
  FOREIGN KEY ("pedestrian_crossing_physical_facilities_id") REFERENCES "pedestrain_crossing_pf" ("pedestrian_crossing_physical_facilities_id"),
  FOREIGN KEY ("accident_id") REFERENCES "accidents" ("accident_id")
);

CREATE TABLE "light_conditions_map" (
  "light_conditions_id" int,
  "accident_id" int,
  FOREIGN KEY ("light_conditions_id") REFERENCES "light_conditions" ("light_conditions_id"),
  FOREIGN KEY ("accident_id") REFERENCES "accidents" ("accident_id")
);

CREATE TABLE "weather_conditions_map" (
  "weather_conditions_id" int,
  "accident_id" int,
  FOREIGN KEY ("weather_conditions_id") REFERENCES "weather_conditions" ("weather_conditions_id"),
  FOREIGN KEY ("accident_id") REFERENCES "accidents" ("accident_id")
);

CREATE TABLE "road_surface_conditions_map" (
  "road_surface_conditions_id" int,
  "accident_id" int,
  FOREIGN KEY ("road_surface_conditions_id") REFERENCES "road_surface_conditions" ("road_surface_conditions_id"),
  FOREIGN KEY ("accident_id") REFERENCES "accidents" ("accident_id")
);

CREATE TABLE "special_condition_at_site_map" (
  "special_conditions_at_site_id" int,
  "accident_id" int,
  FOREIGN KEY ("special_conditions_at_site_id") REFERENCES "special_conditions_at_site" ("special_conditions_at_site_id"),
  FOREIGN KEY ("accident_id") REFERENCES "accidents" ("accident_id")
);

CREATE TABLE "carriage_hazard_map" (
  "carriage_hazard_id" int,
  "accident_id" int,
  FOREIGN KEY ("carriage_hazard_id") REFERENCES "carriage_hazard" ("carriage_hazard_id"),
  FOREIGN KEY ("accident_id") REFERENCES "accidents" ("accident_id")
);

CREATE TABLE "urban_rural_area_map" (
  "urban_rural_area_id" int,
  "accident_id" int,
  FOREIGN KEY ("urban_rural_area_id") REFERENCES "urban_rural_area" ("urban_rural_area_id"),
  FOREIGN KEY ("accident_id") REFERENCES "accidents" ("accident_id")
);

CREATE TABLE "road_pedestrian_crossing_hc_map" (
  "pedestrian_crossing_human_control_id" int,
  "first_road_id" int,
  FOREIGN KEY ("pedestrian_crossing_human_control_id") REFERENCES "pedestrain_crossing_hc" ("pedestrian_crossing_human_control_id"),
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id")
);

CREATE TABLE "road_pedestrian_crossing_pf_map" (
  "pedestrian_crossing_physical_facilities_id" int,
  "accident_id" int,
  FOREIGN KEY ("pedestrian_crossing_physical_facilities_id") REFERENCES "pedestrain_crossing_pf" ("pedestrian_crossing_physical_facilities_id"),
  FOREIGN KEY ("accident_id") REFERENCES "accidents" ("accident_id")
);

CREATE TABLE "road_light_conditions_map" (
  "light_conditions_id" int,
  "first_road_id" int,
  FOREIGN KEY ("light_conditions_id") REFERENCES "light_conditions" ("light_conditions_id"),
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id")
);

CREATE TABLE "road_weather_conditions_map" (
  "weather_conditions_id" int,
  "first_road_id" int,
  FOREIGN KEY ("weather_conditions_id") REFERENCES "weather_conditions" ("weather_conditions_id"),
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id")
);

CREATE TABLE "road_road_surface_conditions_map" (
  "road_surface_conditions_id" int,
  "first_road_id" int,
  FOREIGN KEY ("road_surface_conditions_id") REFERENCES "road_surface_conditions" ("road_surface_conditions_id"),
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id")
);

CREATE TABLE "road_special_condition_at_site_map" (
  "special_conditions_at_site_id" int,
  "first_road_id" int,
  FOREIGN KEY ("special_conditions_at_site_id") REFERENCES "special_conditions_at_site" ("special_conditions_at_site_id"),
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id")
);

CREATE TABLE "road_carriage_hazard_map" (
  "carriage_hazard_id" int,
  "first_road_id" int,
  FOREIGN KEY ("carriage_hazard_id") REFERENCES "carriage_hazard" ("carriage_hazard_id"),
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id")
);

CREATE TABLE "road_urban_rural_area_map" (
  "urban_rural_area_id" int,
  "first_road_id" int,
  FOREIGN KEY ("urban_rural_area_id") REFERENCES "urban_rural_area" ("urban_rural_area_id"),
  FOREIGN KEY ("first_road_id") REFERENCES "first_road" ("first_road_id")
);