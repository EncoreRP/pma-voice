<template>
    <body>
        <audio id="audio_on" src="mic_click_on.ogg"></audio>
        <audio id="audio_off" src="mic_click_off.ogg"></audio>

        <div class="voiceInfo" v-if="voice.visible">
            <p v-if="voice.voiceModes.length">
                <strong>Voice:</strong> <span :class="{ talking: voice.talking }">{{ voice.voiceModes[voice.voiceMode][1] }} <span v-if="voice.callInfo !== 0">(On Call)</span></span>
            </p>

            <p v-if="voice.radioEnabled && voice.radioChannel !== 0">
                <strong>Radio:</strong> <span :class="{ talking: voice.usingRadio }">{{ voice.radioChannelFormatted }} MHz</span>
            </p>
        </div>
    </body>
</template>

<script>
import { reactive } from 'vue';

export default {
    name: 'App',

    setup() {
        const voice = reactive({
            visible: true,
            voiceModes: [],
            voiceMode: 0,
            radioChannel: 0,
            radioChannelFormatted: 'Disconnect',
            radioEnabled: false,
            usingRadio: false,
            callInfo: 0,
            talking: false,
        });

        window.addEventListener("message", function(event) {
            const data = event.data;

            if (data.visible !== undefined) {
                voice.visible = data.visible;
            }

            if (data.voiceModes !== undefined) {
                voice.voiceModes = JSON.parse(data.voiceModes);
            }

            if (data.voiceMode !== undefined) {
                voice.voiceMode = data.voiceMode;
            }

            if (data.radioChannel !== undefined) {
                voice.radioChannel = data.radioChannel;

                if (!voice.radioChannel || voice.radioChannel === 0) {
                    voice.radioChannelFormatted = 'Disconnect';
                } else {
                    if (voice.radioChannel.toString().length > 3) {
                        var frequency    = voice.radioChannel.toString().substring(0, 2);
                        var subFrequency = voice.radioChannel.toString().substring(2,4);
                    } else {
                        var frequency    = voice.radioChannel.toString().substring(0, 1);
                        var subFrequency = voice.radioChannel.toString().substring(1,3);    
                    }

                    if (subFrequency.length < 2) {
                        subFrequency = '0' + subFrequency;
                    }

                    voice.radioChannelFormatted = frequency + '.' + subFrequency;
                }
            }

            if (data.radioEnabled !== undefined) {
                voice.radioEnabled = data.radioEnabled;
            }

            if (data.callInfo !== undefined) {
                voice.callInfo = data.callInfo;
            }

            if (data.usingRadio !== voice.usingRadio) {
                voice.usingRadio = data.usingRadio;

                if (voice.usingRadio) {
                    voice.talking = true;
                }
            }

            if (data.talking !== undefined) {
                voice.talking = data.talking;

                if (!voice.talking) {
                    voice.usingRadio = false;
                }
            }

            if (data.sound && voice.radioEnabled) {
                let click = document.getElementById(data.sound);

                click.load();
                click.volume = data.volume;

                click.play().catch((e) => {});
            }
        });

        return { voice };
    },
};
</script>

<style>
.voiceInfo {
    font-family: 'Arial';

    position: fixed;
    top: 10px;
    left: 10px;

    padding: 0;

    font-size: 10px;
    color: white;
    text-transform: uppercase;
}

.talking {
    color: rgba(244, 196, 65, 255);
}

p {
    margin: 0;
}
</style>
