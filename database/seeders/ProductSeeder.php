<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $products = [
            [
                'name' => 'Aircon Parts - Supply Grille',
                'description' => 'Durable polymer grilles designed for optimal airflow in air-conditioning systems.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/AirconParts.jpg',
                'features' => [
                    'Optimized for maximum airflow',
                    'UV and temperature resistant',
                    'Available in multiple colors'
                ]
            ],
            [
                'name' => 'Electric Fan Parts Series',
                'description' => 'High-performance polymer components for electric fan assemblies.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/ElectricFanParts.jpg',
                'features' => [
                    'Precision balanced components',
                    'Lightweight yet durable',
                    'Reduced vibration and noise'
                ]
            ],
            [
                'name' => 'Plastic Core (12MM and 18MM)',
                'description' => 'Precision plastic cores for industrial applications.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/PlasticCore.jpg',
                'features' => [
                    'Available in 12mm and 18mm sizes',
                    'High dimensional accuracy',
                    'Chemical and wear resistant'
                ]
            ],
            [
                'name' => 'Motorcycle Wire Insulator - Grommet',
                'description' => 'Protective grommets for motorcycle wiring systems.',
                'category' => 'automotive',
                'material_type' => 'rubber',
                'image_url' => '/storage/assets/img/products/Grommet.jpg',
                'features' => [
                    'Excellent electrical insulation',
                    'UV and weather resistant',
                    'Withstands extreme temperatures'
                ]
            ],
            [
                'name' => 'Footing Stove',
                'description' => 'Portable heater used on construction sites to provide warmth or aid in concrete curing.',
                'category' => 'appliance',
                'material_type' => 'rubber',
                'image_url' => '/storage/assets/img/products/FootingStove.jpg',
                'features' => [
                    'Durable rubber base for stable support',
                    'Heat-resistant material for safety',
                    'Prevents slipping and surface scratches'
                ]
            ],
            [
                'name' => 'Car Part Accessory - Front Rubber Base',
                'description' => 'Car accessory that provides cushioning and protection for the vehicle\'s front underbody.',
                'category' => 'automotive',
                'material_type' => 'rubber',
                'image_url' => '/storage/assets/img/products/FrontRubberBase.jpg',
                'features' => [
                    'Provides stable front-end support',
                    'Reduces vibration and road noise',
                    'Made from durable, weather-resistant rubber'
                ]
            ],
            [
                'name' => 'Gas Stove Part - Knob',
                'description' => 'Control accessory used to adjust the flame intensity on a gas burner.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/GasStovePart.jpg',
                'features' => [
                    'Easy-grip design for smooth control',
                    'Heat-resistant and durable material',
                    'Universal fit for most gas stoves'
                ]
            ],
            [
                'name' => 'Car Part Accessory - Rear Rubber Base',
                'description' => 'Car accessory that cushions and protects the vehicle\'s rear underbody from impact and wear.',
                'category' => 'automotive',
                'material_type' => 'rubber',
                'image_url' => '/storage/assets/img/products/RearRubberBase.jpg',
                'features' => [
                    'Supports rear chassis stability',
                    'Minimizes road impact and noise',
                    'Durable rubber construction for long-term use'
                ]
            ],
            [
                'name' => 'Refrigerator Part - Freezer Door',
                'description' => 'Refrigerator part that seals the freezer compartment to maintain low temperatures and preserve frozen items.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/FreezerDoor.jpg',
                'features' => [
                    'Provides secure sealing to lock in cold air',
                    'Durable and insulated for energy efficiency',
                    'Designed for easy opening and closing'
                ]
            ],
            [
                'name' => 'Paint Packaging Set - 1 Gallon (4L)',
                'description' => 'Durable and secure container set for storing and transporting up to 4 liters (1 gallon) of paint.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/PaintPackaging.jpg',
                'features' => [
                    'Leak-proof container ideal for paint storage',
                    'Sturdy handle for easy carrying',
                    'Tight-seal lid to prevent spills and drying'
                ]
            ],
            [
                'name' => 'Battery Accessory - Battery Dispenser Assembly',
                'description' => 'Compact and organized assembly for dispensing and storing batteries efficiently.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/BatteryDispenser.jpg',
                'features' => [
                    'Organizes and dispenses batteries efficiently',
                    'Compact design for easy storage and access',
                    'Protects batteries from dust and damage'
                ]
            ],
            [
                'name' => 'Paso Small',
                'description' => 'A small plant pot made of plastic. It is commonly used for planting flowers, herbs, or small decorative plants.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/PasoSmall.png',
                'features' => [
                    'Durable plastic construction ideal for indoor or outdoor use',
                    'Compact size perfect for herbs, succulents, or small flowers'
                ]
            ],
            [
                'name' => 'Hanging Pots',
                'description' => 'Containers used for growing plants that are suspended from ceilings, walls, or hooks.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/HangingPots.png',
                'features' => [
                    'Space-saving design ideal for balconies, patios, or walls',
                    'Secure hanging system with strong ropes or hooks',
                    'Made from weather-resistant materials for long-lasting use'
                ]
            ],
            [
                'name' => 'Christmas Pots',
                'description' => 'Decorative plant pots designed with holiday themes, often in colors like red, green, gold, or silver.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/ChristmasPots.png',
                'features' => [
                    'Festive holiday designs in red, green, gold, or silver',
                    'Perfect for seasonal plants like poinsettias or mini trees',
                    'Reusable décor item that adds a cheerful holiday touch'
                ]
            ],
            [
                'name' => 'Dog Food Feeder',
                'description' => 'A container or device used to hold and serve food for dogs.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/DogFeeder.jpg',
                'features' => [
                    'Made from safe, non-toxic, and easy-to-clean materials',
                    'Stable, anti-slip base to prevent spills during feeding'
                ]
            ],
            [
                'name' => 'Nicera Tray',
                'description' => 'A type of plastic tray often used for serving food, drinks, or organizing small items.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/Tray.png',
                'features' => [
                    'Lightweight and durable plastic, ideal for everyday use',
                    'Versatile design suitable for serving, storage, or organization',
                    'Easy to clean and resistant to stains or spills'
                ]
            ],
            [
                'name' => 'Paso Big',
                'description' => 'A large plant pot, usually made of plastic. It is ideal for planting bigger plants, shrubs, or small trees.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/PasoBig.png',
                'features' => [
                    'Large capacity suitable for bigger plants, shrubs, or small trees',
                    'Made from sturdy, weather-resistant plastic for indoor or outdoor use'
                ]
            ],
            [
                'name' => 'Guard Mark',
                'description' => 'A protective or safety marker/cover used in electronic equipment.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/GuardMark.png',
                'features' => [
                    'Designed to provide safety marking or protection on Panasonic equipment',
                    'Helps prevent accidental contact with sensitive or moving parts',
                    'Durable material ensures long-lasting visibility and performance'
                ]
            ],
            [
                'name' => 'Switch Knob',
                'description' => 'A small control handle used to turn a device on or off or adjust its settings.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/SwitchKnob.png',
                'features' => [
                    'Ergonomic design for easy grip and smooth turning',
                    'Used to control power or adjust settings on devices',
                    'Compatible with various Panasonic equipment'
                ]
            ],
            [
                'name' => 'Stand Cap',
                'description' => 'A protective cap or cover designed to fit onto the stand or base of electronic equipment.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/StandCap.png',
                'features' => [
                    'Protective cover designed to fit securely on equipment stands or bases',
                    'Shields internal components from dust, debris, or damage',
                    'Durable and precise fit for Panasonic devices'
                ]
            ],
            [
                'name' => 'Switch Button',
                'description' => 'A small control used to turn a device or machine on or off, or to change its mode.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/SwitchButton.png',
                'features' => [
                    'Tactile control for turning devices on/off or switching modes',
                    'Made from durable materials for frequent use',
                    'Compact design integrates seamlessly with control panels'
                ]
            ],
            [
                'name' => 'Wheel',
                'description' => 'A round object that helps things move by rolling.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/Wheel.png',
                'features' => [
                    'Facilitates smooth movement of Panasonic equipment or components',
                    'Made from durable, wear-resistant materials for long-term performance',
                    'Designed for easy installation and reliable mobility'
                ]
            ],
            [
                'name' => 'Indicator Knob',
                'description' => 'A small control dial that shows and adjusts the setting or level of a device.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/IndicatorKnob.png',
                'features' => [
                    'Provides precise control and clear visual feedback for settings adjustment',
                    'Commonly used for functions like volume, speed, or temperature control',
                    'Ergonomic design ensures smooth operation'
                ]
            ],
            [
                'name' => 'Footing FS600 w/ Adap.',
                'description' => 'A sturdy support base designed to provide stable mounting and anchoring for equipment or structural components.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Provides a stable and secure base for mounting equipment',
                    'Includes an adaptor for compatibility with FS600 systems',
                    'Constructed from durable materials for long-term support'
                ]
            ],
            [
                'name' => 'Footing Adaptor w/ Bolt FS600',
                'description' => 'A strong footing adaptor designed for the FS600 model.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Designed specifically to fit the FS600 footing system',
                    'Includes bolt for secure attachment and easy installation',
                    'Ensures stable alignment and reliable support'
                ]
            ],
            [
                'name' => 'Footing Adaptor SL100',
                'description' => 'A footing adaptor used with the SL100 model to ensure proper fit and alignment between the base and supported equipment.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Compatible adaptor for the SL100 footing system',
                    'Offers precise fit for stable connection between base and equipment',
                    'Built for durability and proper alignment in structural setups'
                ]
            ],
            [
                'name' => 'Footing w/o Rubber Cap',
                'description' => 'A standard footing or base used to support poles or equipment.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Serves as a stable base for supporting poles or equipment',
                    'Designed for secure placement without the need for a rubber cap',
                    'Made from durable materials suitable for indoor or outdoor use'
                ]
            ],
            [
                'name' => 'Rubber Bumper',
                'description' => 'A protective rubber piece designed to absorb impact, prevent scratches, and reduce noise or vibration.',
                'category' => 'industrial',
                'material_type' => 'rubber',
                'image_url' => '',
                'features' => [
                    'Absorbs impact to protect equipment and surfaces',
                    'Helps reduce noise, vibration, and potential damage',
                    'Made from high-quality rubber for long-lasting performance'
                ]
            ],
            [
                'name' => 'Pl Compt Lock Male FS800 Black',
                'description' => 'A plastic component lock (male part) designed for the FS800 model.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Male component lock designed for FS800 systems',
                    'Provides secure interlocking fit with the corresponding female part',
                    'Made from durable black plastic for strength and consistency'
                ]
            ],
            [
                'name' => 'Pl Compt Lock Female FS800 Black',
                'description' => 'A plastic component lock (female part) for the FS800 model.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Ensures tight, secure connection with male counterpart',
                    'Constructed from sturdy black plastic for reliable use',
                    'Designed specifically for FS800 systems'
                ]
            ],
            [
                'name' => 'Gallon 4 Liters',
                'description' => 'A 4-liter plastic gallon container used for storing and carrying liquids such as water, oil, or cleaning solutions.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Made from durable plastic for long-term use',
                    'Ideal for industrial, household, or commercial applications',
                    '4-liter capacity for liquid storage and transport'
                ]
            ],
            [
                'name' => 'Gallon Cover',
                'description' => 'A protective lid or cap designed to fit securely on a gallon container.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Secure-fit lid designed to seal gallon containers',
                    'Prevents spills, contamination, and evaporation',
                    'Made from chemical-resistant material'
                ]
            ],
            [
                'name' => 'Gallon Handle',
                'description' => 'The sturdy grip or attachment on a gallon container that makes it easy to lift, carry, and pour.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Strong grip attachment for easy lifting and pouring',
                    'Ergonomic design improves handling and reduces strain',
                    'Built from durable plastic to support heavy use'
                ]
            ],
            [
                'name' => 'Drain Seal',
                'description' => 'A cover or stopper used to block or seal a drain opening.',
                'category' => 'appliance',
                'material_type' => 'rubber',
                'image_url' => '',
                'features' => [
                    'Used to seal or block drain outlets in appliances',
                    'Prevents water leakage and ensures proper drainage',
                    'Made from flexible, durable material for a secure fit'
                ]
            ],
            [
                'name' => 'Back Cover Small',
                'description' => 'A protective rear panel appliances, such as air conditioners.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Rear protective panel for appliances, such as air conditioners',
                    'Shields internal components from dust and damage',
                    'Made to fit securely and ensure reliable performance'
                ]
            ],
            [
                'name' => 'Front Cover Small E-Door',
                'description' => 'A protective front panel designed for the electronic door appliances, such as air conditioners.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Front-facing panel designed for the electronic doors of appliances',
                    'Provides protection for sensitive electronic components',
                    'Precision-molded for a secure, flush fit with the appliance body'
                ]
            ],
            [
                'name' => 'Back Cover Big',
                'description' => 'A large protective rear panel designed for the electronic door appliances, such as air conditioners.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Large rear protective panel for the electronic doors',
                    'Shields internal components from dust, moisture, and damage',
                    'Built for durability and a precise fit on larger appliance models'
                ]
            ],
            [
                'name' => 'Front Cover Big E-Door',
                'description' => 'A large protective front panel designed for the electronic door appliances, such as air conditioners.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Large front panel designed to protect the electronic door of air conditioners',
                    'Helps enclose and protect sensitive front-facing components',
                    'Molds securely into place for a clean, professional finish'
                ]
            ],
            [
                'name' => 'Drain Pan',
                'description' => 'A shallow container placed under equipment, such as air conditioners, refrigerators, or sinks, to collect and hold water or liquid drips.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/DrainPan.png',
                'features' => [
                    'Collects and holds water or condensation from appliances like air conditioners',
                    'Prevents leaks and protects surrounding areas from water damage',
                    'Made from corrosion-resistant materials for long-lasting use'
                ]
            ],
            [
                'name' => 'Plastic Roller Hinges',
                'description' => 'A type of hinge that has a built-in plastic roller, allowing doors, panels, or covers to open and close smoothly.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '',
                'features' => [
                    'Built-in plastic roller for smooth and quiet movement',
                    'Durable plastic construction for long-lasting use',
                    'Ideal for doors, panels, or covers in various applications'
                ]
            ],
            [
                'name' => 'E-Door Assy',
                'description' => 'An E-Door Assy (Electronic Door Assembly) is a complete set of components that make up an electronic door system.',
                'category' => 'appliance',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/EdoorAssy.png',
                'features' => [
                    'Complete assembly forming an electronic door system',
                    'Designed for reliable operation and easy integration',
                    'Includes necessary parts for installation and maintenance'
                ]
            ],
            [
                'name' => 'Ice Cream Containers',
                'description' => 'A plastic ice cream container, featuring tall, rounded, and rectangular tubs.',
                'category' => 'industrial',
                'material_type' => 'plastic',
                'image_url' => '/storage/assets/img/products/IceCreamContainer.png',
                'features' => [
                    'Made from food-grade materials to ensure safety and freshness',
                    'Available in various sizes for retail or household use',
                    'Keeps ice cream fresh and well-sealed'
                ]
            ]
        ];

        foreach ($products as $product) {
            Product::create($product);
        }
    }
}