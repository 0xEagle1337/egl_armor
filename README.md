🛡 egl_armor // ESX & QBCore Compatible Ballistic Vest Enhancement Script

This script enriches the experience for players on FiveM servers using ESX or QBCore by introducing a realistic feature where ballistic protection is applied only when a ballistic vest, categorized under Body Armor, is worn. It simulates the action of inserting ballistic plates into the vest, turning standard clothing items into functional protective gear.

# 🌟 Features

    Realistic Ballistic Protection: Players can enhance their ballistic vests by using specific items, representing ballistic plates, to gain actual ballistic protection.
    Requirement for Actual Vest: Ensures ballistic protection is only provided when wearing an allowed vest from the Body Armor category, enhancing realism.
    Configurable Replacement Logic: Administrators can choose between three modes for armor replacement: fill, empty, or override.
    ESX and QBCore Compatibility: Seamlessly integrates with the most popular frameworks, ensuring wide server compatibility.
    Intuitive Use: Interaction is straightforward, through the player's inventory, with no need for a complex user interface.
    Configurable Protection Levels: Administrators can set the armor value for each plate item, tailoring the level of protection to gameplay needs.

# 🛠 Installation

    Download the release last version.
    Place the script in your server's resources folder.
    Add start egl_armor to your server.cfg file.
    Tailor the script to your server by adjusting the config.lua file, defining armor values and compatible vests.

# 📦 Dependencies

    Requires ESX or QBCore framework installed on your server to function effectively.

# ⚙️ Configuration

The config.lua file holds key settings to adapt the script to your server's specifics:

    Vest Items (config.Items): Defines the item names for your ballistic plates, like 'plate1', 'plate2', 'plate3', 'plate4'.
    Armor Values (config.Armor): Sets the amount of armor each plate provides, options include 25, 50, 75, 100.
    Allowed Vests (config.allowedVests): Lists the IDs of clothing allowed from the Body Armor category, ensuring compatibility and realism, such as 13, 22, 23, 24, 25, 26, 27, 29, 34, 39, 42, 44, 49, 51, 54, 60, 80.
    Replacement Logic (config.replaceMode): Determines how armor plates are applied:
        "fill": Adds armor incrementally up to the maximum value (100).
        "empty": Applies armor only if the current armor value is 0.
        "override": Replaces the current armor value with the new plate's value, regardless of the existing armor.

# 🤝 Contribution

Contributions are welcome! If you have ideas for new features, compatibility enhancements, or bug fixes, please create a pull request.

# 📄 License

This project is licensed under the MIT License. For more details, refer to the LICENSE file.

# 📞 Support and Contact

For issues or questions, please open an issue on this GitHub repository or join my Discord community server: https://discord.gg/BCaP4CtJpP or reach out directly to me: 0xeagle1337.
