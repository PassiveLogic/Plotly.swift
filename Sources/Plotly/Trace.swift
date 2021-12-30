
/// Data series that for displaying in a _Plotly_ chart.
public protocol Trace: Encodable {
    /// One of the supported _Plotly.js_ trace types, i.e. "scatter", "bar", "pie" and so on.
    ///
    /// - TODO:
    ///   This should be a static variable always encoded to JSON.
    var type: String { get }
    /// Switch indicating whether the trace supports animation of its data.
    static var animatable: Bool { get }

    /// Unique identifier used to track traces between animation frames.
    var uid: String? { get set }
    /// Name of the trace. Displayed in legend by default.
    var name: String? { get set }
    /// Flag indicating whether the trace is hidden.
    var visible: Visible? { get set }
}

public extension Trace {
    /// Shows interactive figure containing the trace in the default browser on your OS.
    ///
    /// This method is useful for quickly previewing a trace. It saves a few line of code because it avoids explicitly constructing
    /// the `Figure` object. Optionally, it also accepts configuration and layout options to fine-tune the appearance.
    ///
    /// Here's a one-liner that shows a scatter trace:
    /// ```swift
    /// try Scatter(x: [1, 2, 3], y: [4, 6, 5]).show()
    /// ```
    ///
    /// - Parameters:
    ///   - layout: Settings affecting layout of the figure, i.e. subplots, axis, title and more.
    ///   - config: Configuration of the figure, i.e. toolbar, watermark, scrolling, locale and more.
    @discardableResult
    @available(iOS 10.0, *)
    func show(layout: Layout = Layout(), config: Config = Config()) throws -> Figure {
        let figure = Figure(data: [self], layout: layout, config: config)
        try figure.show()
        return figure
    }
}

