# KL_AnimPos 🎬

Welcome to the `kl_animpos` repository! This script is designed for FiveM servers and allows players to fine-tune their animation positions with ease. Inspired by the "SNR Animation Position" script, our goal is to provide a similar experience without the hefty price tag.

## Features ✨

- **Standalone**: No dependencies required.
- **Easy to Use**: Activate noclip mode and adjust your position effortlessly.
- **Customizable Controls**: Move with WASD, adjust height with arrow keys, and rotate with the mouse wheel.
- **Logging**: Detailed logs sent to a Discord webhook for monitoring.

## Getting Started 🚀

### Installation 📥

1. **Clone the Repository**:
    ```sh
    git clone https://github.com/ottersek/kl_animpos.git
    ```

2. **Folder Structure**:
    Ensure your folder structure looks like this:
    ```
    kl_animpos/
    ├── client/
    │   └── main.lua
    ├── server/
    │   └── main.lua
    └── fxmanifest.lua
    ```

3. **Add to Server Resources**:
    Place the `kl_animpos` folder into your server's `resources` directory.

4. **Configure the Server**:
    Add the following line to your `server.cfg`:
    ```sh
    start kl_animpos
    ```
    or
    ```sh
    ensure kl_animpos
    ```

### Configuration 🔧

To enable logging to a Discord webhook, you need to set the webhook URL in the `server/main.lua` file. Find the following line:

```lua
local webhookUrl = 'your webhook for discord logs'
```

Replace it with your own Discord webhook URL if necessary.

### Usage 📋

1. **Activate AnimPos Mode**:
    Use the command `/animpos` in the chat. This will toggle the noclip mode, allowing you to adjust your position.

2. **Adjust Position**:
    - **Move**: Use `WASD` keys.
    - **Height**: Use the `arrow up` and `arrow down` keys.
    - **Rotate**: Use the mouse wheel.

3. **Finalize or Cancel**:
    - **Enter**: Fix the position.
    - **Delete**: Cancel and revert to the original position.
  

## Preview 📹

[![Preview SNR Animation Position](https://img.youtube.com/vi/9UtkNABQT3Q/0.jpg)](https://www.youtube.com/watch?v=9UtkNABQT3Q)

## Logging System 📝

Every time a player uses the `/animpos` command, a detailed log is sent to the configured Discord webhook. The log includes:

- Player identifiers
- Server ID
- Discord ID
- Initial position
- Finalized position (if applicable)
- Command usage status (initiated, cancelled, or fixed)

## Acknowledgements 🙌

This script is a basic, initial version inspired by the "SNR Animation Position" script, which we believe is overpriced for its functionality. We aim to provide a free alternative that delivers the same core features.
Buy the script we have been inspired by if you wish: https://snrstore.tebex.io/package/5984597
Preview of the script: https://www.youtube.com/watch?v=9UtkNABQT3Q

## License 📄

This project is licensed under the MIT License - see the [LICENSE](https://github.com/ottersek/kl_animpos/blob/main/LICENSE) file for details.

## Stay Updated! 📢

Follow me on [Cfx.re (FiveM) Forum](https://forum.cfx.re/u/otternetwork/) to stay updated on all my FiveM activities and future updates to this script.

## Contribution 🤝

Feel free to contribute to the project by opening issues or submitting pull requests. We welcome any improvements or suggestions!

---

Enjoy fine-tuning your animations with `kl_animpos`! If you encounter any issues or have suggestions, please let us know.
