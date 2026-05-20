import os
import re

class CoverageAnalyzer:
  def __init__(self):
    self.re_instance = re.compile(r'^Instance:\s+(/\S+)')
    self.re_expr_cov = re.compile(r'^\s*Expression coverage:\s*([\d\.]+)%')
    self.re_cond_cov = re.compile(r'^\s*Condition coverage:\s*([\d\.]+)%')
    self.re_branch_cov = re.compile(r'^\s*Branch coverage:\s*([\d\.]+)%')
    
    self.re_expr_details = re.compile(r'^Expression details:')
    self.re_cond_details = re.compile(r'^Condition details:')
    self.re_line_exp = re.compile(r'^Line\s+\d+\s*:(.+)')

  def analyze(self, txt_path):
    if not os.path.exists(txt_path):
      return []

    instances = []
    current_inst = None
    in_details = False
    current_expr = None

    with open(txt_path, 'r', encoding='utf-8', errors='ignore') as f:
      for line in f:
        line = line.rstrip()
          
        # Detect new Instance block
        m_inst = self.re_instance.search(line)
        if m_inst:
          if current_inst:
            instances.append(current_inst)
          current_inst = {
            "Path": m_inst.group(1),
            "ExprCov": 100.0,
            "CondCov": 100.0,
            "BranchCov": 100.0,
            "Gaps": []
          }
          in_details = False
          continue
          
        if not current_inst:
          continue

        # Coverage Metrics
        m_expr = self.re_expr_cov.search(line)
        if m_expr: current_inst["ExprCov"] = float(m_expr.group(1))
        m_cond = self.re_cond_cov.search(line)
        if m_cond: current_inst["CondCov"] = float(m_cond.group(1))
        m_branch = self.re_branch_cov.search(line)
        if m_branch: current_inst["BranchCov"] = float(m_branch.group(1))

        # Transition to Details section
        if self.re_expr_details.search(line) or self.re_cond_details.search(line):
          in_details = True
          continue

        if in_details:
          # Identify the expression logic string
          m_line = self.re_line_exp.search(line)
          if m_line:
            current_expr = m_line.group(1).strip()
            continue
          
          # Capture gaps (indicated by missing hits logic)
          if current_expr and ("not hit" in line or "None hit" in line or "x" in line.lower() or "✘" in line):
            clean_hint = line.strip()
            # Avoid capturing the table header
            if clean_hint and not clean_hint.startswith("Input Term"):
              current_inst["Gaps"].append({
                "Expression": current_expr,
                "Hint": clean_hint
              })
              # Clear current_expr to grab only the first failure per logic block to reduce spam
              current_expr = None 

    if current_inst:
      instances.append(current_inst)

    return instances

  def get_top_gaps(self, instances, threshold=50.0, top_n=5):
    # Filter instances with poor coverage that actually have extracted gap details
    filtered = [i for i in instances if min(i["ExprCov"], i["CondCov"]) < threshold and len(i["Gaps"]) > 0]
    # Sort by worst average
    filtered.sort(key=lambda x: (x["ExprCov"] + x["CondCov"]) / 2.0)
    return filtered[:top_n]
