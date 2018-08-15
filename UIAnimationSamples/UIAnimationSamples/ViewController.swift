/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class ViewController: UIViewController {

  /// The currently selected curve to be used for all animations
  var selectedCurve: UIView.AnimationCurve = .easeInOut

  /// The ⬇️ button that rotates and moves around the screen
  @IBOutlet var movingButton: UIButton!

  /// The fake HUD view
  @IBOutlet var hud: FakeHUD?
  
  @IBAction func moveTo(button: UIButton) {
  }
  
  @IBAction func rotate(button: UIButton) {
  }
  
  @IBAction func zoomIn(button: UIButton) {
  }
  
  @IBAction func showHUD() {
  }
  
  @IBAction func dismissHUD() {
  }

  @IBAction func changeBackgroundColor() {
  }

}

// MARK: AnimationCurvePickerViewControllerDelegate
extension ViewController: AnimationCurvePickerViewControllerDelegate {
  
  func animationCurvePickerViewController(_ controller: AnimationCurvePickerViewController, didSelectCurve curve: UIView.AnimationCurve) {
  }
  
}
