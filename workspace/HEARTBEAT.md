# HEARTBEAT.md - Periodic Check-in

_When you receive a heartbeat, run through this checklist. Be efficient - don't check everything every time._

## Quick Health Check (Every Heartbeat)

1. **System resources OK?** - If Pi feels slow, check `free -h` briefly
2. **Any pending messages?** - Respond if something needs attention
3. **Nothing urgent?** - Reply `HEARTBEAT_OK` and save tokens

## Rotating Checks (Pick 1-2 per heartbeat)

### Security Scan
- [ ] Recent logs clean? No suspicious activity?
- [ ] Gateway still running? `openclaw gateway status`
- [ ] No unexpected processes? Quick `top` glance

### Memory Maintenance
- [ ] Context getting full? Write important stuff to daily notes
- [ ] Any learnings to log? Update `.learnings/` files
- [ ] Time to distill daily notes into MEMORY.md?

### Proactive Ideas
- [ ] What could I build that would help Trippy?
- [ ] Any patterns I'm noticing that could be automated?
- [ ] Anything time-sensitive coming up?

## When to Reach Out

**Do contact:**
- Something broke or needs attention
- Found something useful/interesting
- Security concern detected
- It's been a while since any interaction

**Don't contact:**
- Late night (23:00-08:00 CST) unless urgent
- Just checked < 30 min ago with nothing new
- Would just be saying "all good" again

## State Tracking

```json
{
  "lastSecurityCheck": null,
  "lastMemoryReview": null,
  "lastProactiveIdea": null
}
```

---

_Keep this file lean. Every line here costs tokens on every heartbeat._
