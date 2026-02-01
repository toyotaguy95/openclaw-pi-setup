import type { HookHandler } from "openclaw/hooks";
import { writeFileSync } from "fs";
import { homedir } from "os";
import { join } from "path";

const handler: HookHandler = async (event) => {
  if (event.type !== "gateway" || event.action !== "startup") {
    return;
  }

  const stateFile = join(homedir(), "talon-face", "state");

  try {
    writeFileSync(stateFile, "idle\n");
    console.log("[face-init] 🦞 Face set to idle on startup");
  } catch (err) {
    console.error("[face-init] Failed to set face state:", err instanceof Error ? err.message : String(err));
  }
};

export default handler;
