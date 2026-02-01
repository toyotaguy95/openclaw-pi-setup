import type { HookHandler } from "openclaw/hooks";
import { writeFileSync } from "fs";
import { homedir } from "os";
import { join } from "path";

// Track timeout to reset face after processing
let idleTimeout: ReturnType<typeof setTimeout> | null = null;

const handler: HookHandler = async (event) => {
  if (event.type !== "agent" || event.action !== "bootstrap") {
    return;
  }

  const stateFile = join(homedir(), "talon-face", "state");

  try {
    // Clear any existing timeout
    if (idleTimeout) {
      clearTimeout(idleTimeout);
      idleTimeout = null;
    }

    // Set face to thinking
    writeFileSync(stateFile, "thinking\n");
    console.log("[face-thinking] 🤔 Face set to thinking - processing message");

    // Set timeout to return to idle after 60 seconds
    // This is a fallback in case agent doesn't manually set idle
    idleTimeout = setTimeout(() => {
      try {
        writeFileSync(stateFile, "idle\n");
        console.log("[face-thinking] 🦞 Face reset to idle (timeout fallback)");
      } catch (err) {
        console.error("[face-thinking] Failed to reset:", err instanceof Error ? err.message : String(err));
      }
      idleTimeout = null;
    }, 60000); // 60 second timeout

  } catch (err) {
    console.error("[face-thinking] Failed:", err instanceof Error ? err.message : String(err));
  }
};

export default handler;
