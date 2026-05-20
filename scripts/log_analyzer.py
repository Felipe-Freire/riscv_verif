import re
import os

class LogAnalyzer:
  def __init__(self):
    # Compiled Regexes for performance
    self.re_verdict = re.compile(r'\*\*\* TEST (PASSED|FAILED)! \(via (TOHOST|ECALL)\)')
    self.re_timeout = re.compile(r'UVM_FATAL.*(?:TIMEOUT|PH_TIMEOUT)')
    self.re_scoreboard = re.compile(r'\[SCOREBOARD_REPORT\] Total Matches: (\d+) \| Total Mismatches: (\d+)')
    self.re_interrupt_mask = re.compile(r'Received Interrupt\. Mask:')
    self.re_intr_1 = re.compile(r'INTR: 1')
    self.re_illegal_instr = re.compile(r'Illegal instruction \(hart 0\) at PC 0x([0-9a-fA-F]+)')

  def analyze(self, log_path):
    if not os.path.exists(log_path):
      return {"LogFile": os.path.basename(log_path), "Error": "File not found"}

    result = {
      "LogFile": os.path.basename(log_path),
      "Status": "UNKNOWN",
      "TerminationReason": "UNKNOWN",
      "ScoreboardMatches": 0,
      "ScoreboardMismatches": 0,
      "InterruptsRouted": False,
      "IllegalInstructions": 0
    }

    has_mask = False

    with open(log_path, 'r', encoding='utf-8', errors='ignore') as f:
      for line in f:
        # 1. Completion Status and Reason
        m_verdict = self.re_verdict.search(line)
        if m_verdict:
          result["Status"] = m_verdict.group(1)
          result["TerminationReason"] = m_verdict.group(2)

        # 2. Timeout / Fatal
        if self.re_timeout.search(line):
          result["Status"] = "TIMEOUT"
          result["TerminationReason"] = "TIMEOUT"

        # 3. Scoreboard Metrics
        m_score = self.re_scoreboard.search(line)
        if m_score:
          result["ScoreboardMatches"] = int(m_score.group(1))
          result["ScoreboardMismatches"] = int(m_score.group(2))

        # 4. Interrupts
        if not result["InterruptsRouted"]:
          if self.re_interrupt_mask.search(line):
            has_mask = True
          elif has_mask and self.re_intr_1.search(line):
            result["InterruptsRouted"] = True

        # 5. Illegal Instructions
        if self.re_illegal_instr.search(line):
          result["IllegalInstructions"] += 1

    return result
