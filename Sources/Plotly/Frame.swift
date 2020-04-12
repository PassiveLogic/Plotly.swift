
/// **Warning** This is generated code and all changes will be eventually overwritten.
/// See `Sources/Codegen/Readme.md` for more details.


/// TODO.
public struct Frame: Encodable {
    /// An identifier that specifies the group to which the frame belongs, used by animate to select a
    /// subset of frames.
    public var group: String? = nil

    /// A label by which to identify the frame
    public var name: String? = nil

    /// A list of trace indices that identify the respective traces in the data attribute
    public var traces: Anything? = nil

    /// The name of the frame into which this frame's properties are merged before applying.
    /// 
    /// This is used to unify properties and avoid needing to specify the same values for the same
    /// properties in multiple frames.
    public var baseFrame: String? = nil

    /// A list of traces this frame modifies.
    /// 
    /// The format is identical to the normal trace definition.
    public var data: Anything? = nil

    /// Layout properties which this frame modifies.
    /// 
    /// The format is identical to the normal layout definition.
    public var layout: Anything? = nil

    /// Decoding and encoding keys compatible with Plotly schema.
    enum CodingKeys: String, CodingKey {
        case group
        case name
        case traces
        case baseFrame = "baseframe"
        case data
        case layout
    }
    
    /// Creates `Frame` object with specified properties.
    /// 
    /// - Parameters:
    ///   - group: An identifier that specifies the group to which the frame belongs, used by animate to
    ///   select a subset of frames.
    ///   - name: A label by which to identify the frame
    ///   - traces: A list of trace indices that identify the respective traces in the data attribute
    ///   - baseFrame: The name of the frame into which this frame's properties are merged before
    ///   applying.
    ///   - data: A list of traces this frame modifies.
    ///   - layout: Layout properties which this frame modifies.
    public init(group: String? = nil, name: String? = nil, traces: Anything? = nil, baseFrame:
            String? = nil, data: Anything? = nil, layout: Anything? = nil) {
        self.group = group
        self.name = name
        self.traces = traces
        self.baseFrame = baseFrame
        self.data = data
        self.layout = layout
    }
    
}